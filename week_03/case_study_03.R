library(ggplot2)
library(gapminder)
library(dplyr)

head(gapminder)

filtered <- filter(gapminder, country != "Kuwait")

View(filtered)

#plot 1
plot_1 <- ggplot(filtered, aes(lifeExp, gdpPercap)) +
  geom_point(aes(col = continent, size = pop/100000, group = country)) +
  facet_wrap(~year, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  theme_bw() +
  labs(x = "Life Expectency", 
       y = "GDP per capita", 
       title = "Wealth and life expectancy through time",
       color = "Continent", 
       size = "Population (100k)")

#plot 2
gapminder_continent <- filtered %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))


plot_2 <- ggplot() +
  geom_line(filtered, mapping = aes(year, gdpPercap, col = continent)) +
  geom_point(filtered, mapping = aes(year, gdpPercap, col = continent)) +
  labs(color = "Continent") +
  geom_line(gapminder_continent, mapping = aes(year, gdpPercapweighted)) +
  geom_point(gapminder_continent, mapping = aes(year, gdpPercapweighted, size = pop/100000)) +
  labs(size = "Population (100k)") +
  facet_wrap(~continent, nrow = 1) +
  scale_y_continuous(trans = "sqrt") +
  theme_bw()
labs(x = "Year", 
     y = "GDP per capita", 
     title = "Wealth and life expectancy through time") 