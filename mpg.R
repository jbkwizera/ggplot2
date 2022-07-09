library(ggplot2)
library(dplyr)

# Convert fuel efficiency from miles per gallon to liters per 100km (commonly 
# used in most other countries -- than US)
mpgTol100km <- function(mpg) {
  KM_MILE <- 1.609344
  LITER_GALLON <- 3.785411784
  return (100 * LITER_GALLON /(mpg * KM_MILE))
}
mpg <- mpg %>%
  unique() %>%
  mutate(cty_ = mpgTol100km(cty), hwy_ = mpgTol100km(hwy))

# Manufacturers by the number of their models
(mpg %>%
    group_by(manufacturer) %>%
    summarize(n_models = length(manufacturer)) %>%
    arrange(desc(n_models)))

# Models by their number of variations
(mpg %>%
    group_by(model) %>%
    summarize(variations = length(model)) %>%
    arrange(desc(variations)))

# Disregarding drive train specifications on the models' names
mpg$model_nodrv <- ""
for (i in 1:nrow(mpg)) {
  model <- as.character(mpg[i, "model"])
  bound <- nchar(model)
  if      (any(endsWith(model, c("2wd", "4wd", "awd"))) == TRUE) { bound <- bound - 3 }
  else if (endsWith(model, "quattro"))                           { bound <- bound - 7 }
  mpg[i, "model_nodrv"] <- trimws(substr(model, 0, bound))
}

# Manufacturers
(mpg %>%
    select(-model) %>%
    group_by(manufacturer) %>%
    summarize(n_models_unique = length(manufacturer)) %>%
    arrange(desc(n_models_unique)))

# Models
(mpg %>%
    select(-model) %>%
    group_by(model_nodrv) %>%
    summarize(variations = length(model_nodrv)) %>%
    arrange(desc(variations)))
