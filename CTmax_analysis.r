#Analysis of CTmax data from September/October 2025 research trip to Balj River, Mongolia
#Olaf Jensen

library(tidyverse)

#read in data file
data = read.csv("CTmax.csv")

mod1 = lm(Ctmax_degC ~ Species, data = data)

summary(mod1)

mod2 = lm(Ctmax_degC ~ Acclimation, data = data)

summary(mod2)

mod3 = lm(Ctmax_degC ~ Weight_g, data = data)

summary(mod3)

#plotting
species_boxplots <- ggplot(data = data, mapping = aes(x = Species, y = Ctmax_degC)) +
  geom_boxplot() +
  geom_jitter() +
  theme_minimal()

species_boxplots

#Calculate mean CTmax by species

mean_ctmax_species <- data %>%
  group_by(Species) %>%
  summarize(mean_Ctmax = mean(Ctmax_degC, na.rm = TRUE))
mean_ctmax_species
