# Install packages
#install.packages("ggplot2")
#install.packages("broom.mixed")
#install.packages("jtools")

library(ggplot2)
library(broom.mixed)
library(jtools)

# Set directory
setwd("")

# Final abundance analysis (Figure 4)

# Read in CSV
df <- read.csv("GLM_inputs.csv")
df_scaled <- df
df_scaled[,-c(1,7,8)]<- scale(df[, -c(1,7,8)]) #scale variables

# Set up final abundance variable as binary data for binomial GLM
final_abundance_binom<-cbind(I(round(df$final_abundance*100)), 100)
df_scaled$final_abundance_scaled<-I(round(df$final_abundance*100))

# Fit GLM with binomial errors
fit <- glm(final_abundance_binom ~ w+V+temp_gradient+temp_steepness, 
            family=binomial, data=df_scaled, na.action = "na.exclude")

# Summarize model 
fit
summ(fit, confint=TRUE, digits=3)

# Plot coefficients
plot_summs(fit, ci_level = 0.95,legend.title="Final abundance GLM")

# Species richness analysis (Supplement S1)

# Read in CSV
df <- read.csv("rcp45.csv")
df_scaled <- df
df_scaled[,-c(1,7)]<- scale(df[, -c(1,7)]) #scale variables
df_valid <- na.exclude(df_scaled) #exclude NaN values

# Create model
model <- lm(number_45 ~ roc_45 + range, data=df_valid, na.action = "na.fail")

# Plot effect of temperature rate of change
effect_plot(model, pred=roc_45, interval=FALSE, plot.points=TRUE, 
            jitter=0.05, 
            main.title="(A) Number of species and temperature rate of change", 
            x.label="Scaled rate of change (deg C/year)",
            y.label="Scaled number of species")

# Plot effect of temperature range
effect_plot(model, pred=range, interval=FALSE, plot.points=TRUE, 
            jitter = 0.05,
            main.title="(B) Number of species and temperature range", 
            x.label="Scaled temperature range (deg C)",
            y.label="Scaled number of species")

# Print model summary
model
summary(model)

