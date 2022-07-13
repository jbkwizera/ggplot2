library(showtext)
library(ggplot2)
library(dplyr)

# Manufacturers vs. no. of models they each make
(man_model <- mpg %>%
  select(manufacturer, model) %>%
  group_by(manufacturer) %>%
  summarize(n_models = length(manufacturer)) %>%
  ggplot(aes(manufacturer, n_models)) +
  geom_bar(stat = "identity") +
  xlab("Manufacturer") +
  ylab("No. of models") +
  coord_flip() +
  theme(
    text = element_text(family = "Palatino"),
    axis.text.y = element_text(vjust = 0.38)
  ))

# City fuel economy for each drive
(drv_cty <- mpg %>%
  ggplot(aes(drv, cty)) +
  geom_boxplot() +
  scale_x_discrete(
    limits = c("f", "r", "4"),
    labels = c("FWD", "RWD", "4WD")
  ) +
  xlab("Drive") +
  ylab("Fuel economy (mpg)"))

# Drive train-engine size-class relationship
(drv_displ_class <- mpg %>%
  ggplot(aes(reorder(class, displ, FUN = max), displ, color = drv)) +
  geom_jitter(width = 0.5, height = 0) +
  xlab("Class") +
  ylab("Engine size (liters)") +
  scale_color_discrete(
    name = "Drive",
    limits = c("4", "f", "r"),
    labels = c("4WD", "FWD", "RWD")
  ))
