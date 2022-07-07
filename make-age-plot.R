library(tidyverse)
library(distill)
library(ggthemes)
library(plotly)
library(gganimate)

rawdata <- read_csv("traffic_violaions.csv")

agePlot <- rawdata |>
  group_by(driver_age) |>
  summarize(count=n()) |>
  drop_na(driver_age)  |>
  ggplot(aes(x=driver_age, 
             y=count, 
  )) +
  geom_line(color="black") +
  theme(plot.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "darkgrey"),
        panel.grid.minor.x = element_blank()) +
  labs(title="Violations by Age",
       subtitle="At what age are these violations most frequent",
       x="Age of Drivers",
       y="Number of Violations") +
  scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90))

agePlot <- ggplotly(agePlot, tooltip="text") 

write_rds(agePlot, "age-plot.rds")
  