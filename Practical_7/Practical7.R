library(dplyr)
library(tidyr)
library(readr)
library(ggplot2)


gapminder_orig <- read_csv("gapminder.csv")
seps_orig <- read_csv('seps.csv')

gapminder <- gapminder_orig
seps <- seps_orig


#Question 1

q1a <- gapminder %>% filter(year==2007, continent=="Americas") %>% select(country, lifeExp)

q1b <- gapminder %>% filter(gdpPercap == min(gdpPercap))

q1c <- gapminder %>% filter(gdpPercap == max(gdpPercap))

q1d <- gapminder %>% mutate(gdp=pop*gdpPercap)

q1e <- gapminder %>% summarise(mean_life_exp = mean(lifeExp))

q1f <- gapminder %>% group_by(year) %>% summarise(mean_life_exp = mean(lifeExp))

q1g <- gapminder %>% group_by(continent) %>% filter(lifeExp>mean(lifeExp)) %>% summarise(n=n())

q1h <- gapminder %>% mutate(high_life_expectancy = ifelse(lifeExp>mean(lifeExp), 1, 0))

q2a <- seps %>% gather("year", "value", -IcdChapter, -Field)

q2b <- q2a %>% spread(Field, "value")
