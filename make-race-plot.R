library(tidyverse)
library(distill)
library(ggthemes)
library(plotly)
library(gganimate)

rawdata <- read_csv("traffic_violaions.csv")

racePlot <- rawdata |>
  group_by(driver_race) |>
  summarize(count=n()) |>
  drop_na(driver_race) |>
  ggplot(aes(x=count, 
             y=driver_race)) +
  geom_col(fill="white")+
  theme(plot.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "darkgrey"),
        panel.grid.minor.x = element_blank()) +
  labs(title="Violations by Race",
       subtitle="What race has the most frequent violations",
       x="Number of Violations",
       y="Different Types of Race") 


write_rds(racePlot, "race-plot.rds")

