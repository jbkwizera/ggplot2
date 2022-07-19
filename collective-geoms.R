library(dplyr)
library(ggplot2)
library(babynames)

# The group aesthetic
(ggplot(mpg, aes(cyl, hwy, group = cyl)) +
    geom_boxplot())

# Integer displ values distributions
(ggplot(filter(mpg, displ == round(displ)),
        aes(displ, cty, group = displ)) +
    geom_boxplot())

# Hadley name popularity
(babynames %>%
    filter(name == "Hadley") %>%
    ggplot(aes(year, n)) +
    geom_line(aes(group = sex, color = sex), size = 1))
