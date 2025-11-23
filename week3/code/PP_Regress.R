rm(list=ls())
library(dplyr)

MyDF <- read.csv("../data/EcolArchives-E089-51-D1.csv")
dim(MyDF) #check the size of the data frame you loaded

# Rename for convenient call
MyDF <- MyDF %>%
  rename(
    FeedingType   = Type.of.feeding.interaction,
    PredatorStage = Predator.lifestage
  )

# A function returns key regression results after running linear model between Prey mass and Predator mass
regress_fun <- function(df) {
  if (nrow(df) < 2) return(NULL)               # need at least 2 points
  mod <- lm(Prey.mass ~ Predator.mass, data = df)
  s   <- summary(mod)
  data.frame(
    Slope      = coef(mod)[2],
    Intercept  = coef(mod)[1],
    R_squared  = s$r.squared,
    F_stat     = s$fstatistic[1],
    df_num     = s$fstatistic[2],
    df_den     = s$fstatistic[3],
    p_value    = pf(s$fstatistic[1],
                    s$fstatistic[2],
                    s$fstatistic[3],
                    lower.tail = FALSE)
  )
}

# For each pair of Feeding Interaction and Predator Stage, run the linear model mentioned in the above function
regress_results <- MyDF %>%
  group_by(FeedingType, PredatorStage) %>%
  do(regress_fun(.)) %>%
  ungroup() %>%
  mutate(
    FeedingType   = as.character(FeedingType),
    PredatorStage = as.character(PredatorStage)
  )

# Export PP_Regress_Results.csv to ../results/ folder with key regression statistics
write.csv(regress_results, "../results/PP_Regress_Results.csv", row.names = FALSE)

stage_cols <- c(
  "adult"                = "#E41A1C",   # red
  "juvenile"             = "#377EB8",   # blue
  "larva"                = "#4DAF4A",   # green
  "larva / juvenile"     = "#984EA3",   # purple
  "postlarva"            = "#FF7F00",   # orange
  "postlarva/juvenile"   = "#FFFF33"    # yellow
)

# Visualization with ggplot()
p <- ggplot(MyDF,
            aes(x = Predator.mass, y = Prey.mass,
                colour = PredatorStage)) +
  geom_point(alpha = 0.6, size = 0.8) +
  geom_smooth(method = "lm", se = TRUE, size = 0.8, aes(group = PredatorStage)) +
  scale_colour_manual(values = stage_cols, name = "Predator lifestage") +
  facet_wrap(~ FeedingType, ncol = 1, scales = "free_y") +
  scale_x_log10(name = expression((Predator~mass~(g))),
                     breaks = 10^(-7:1),
                     labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  scale_y_log10(name = expression(Prey~mass~(g)),
                     breaks = 10^(-7:1),
                     labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  theme_bw(base_size = 11) +
  theme(
    strip.background = element_rect(fill = "grey90"),
    legend.position = "bottom",
    panel.grid.minor = element_blank()
  )

# Output a .pdf file
pdf("../results/PP_Regress.pdf", width = 8, height = 12)
print(p)
dev.off()