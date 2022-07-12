library(showtext)
library(ggplot2)
library(dplyr)

plt <- mpg %>%
  select(manufacturer, model) %>%
  group_by(manufacturer) %>%
  summarize(n_models = length(manufacturer)) %>%
  ggplot(aes(manufacturer, n_models)) +
    geom_bar(stat = "identity") +
    ylab("No. of models") +
    xlab("Manufacturer") +
    coord_flip() +
    theme(
      text = element_text(family = "Palatino"),
      axis.text.y = element_text(vjust = 0.38))
ggsave("man-models.pdf")

