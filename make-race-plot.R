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
  ggplot(aes(x=driver_race, 
             y=count)) +
  geom_line()+
  theme(plot.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "darkgrey"),
        panel.grid.minor.x = element_blank()) +
  labs(title="Violations by Age",
       subtitle="At what age are these violations most frequent",
       x="Age of Drivers",
       y="Number of Violations") 

write_rds(racePlot, "race-plot.rds")

