# libraries --------------------------------------------------------------------
library(here)    # for creating relative file-paths
library(ggplot2) # for visualizing data 
library(readxl)  # for reading excel files
library(dplyr)

# import -----------------------------------------------------------------------

germ_excel <- read_excel(
  here("data", "input_data", "germination_trials_with_metadata.xlsx"),
  sheet = "raw_data"
)

# visualize data ---------------------------------------------------------------

(germ_plot <- germ_excel |>
  filter(!is.na(Genus)) |>
  ggplot(aes(x = Record_date_ymd, y = Emergence)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) + 
  facet_wrap(~Genus) + 
  labs(
    title = "Sampling days: 20 days",
    x = "Record Date", 
    y = "Percent emergence (out of 100%)"
  ) + 
  theme_bw()
)

