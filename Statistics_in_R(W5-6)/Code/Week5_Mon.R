rm(list=ls())

library(dplyr)
library(ggplot2)
d<-read.table("../Data/SparrowSize.txt", header=TRUE)
d_c <- na.omit(d)
summary(d)
table(d$BirdID)
table(table(d$BirdID))

BirdIDCount <- d %>% count(BirdID,BirdID, sort=TRUE)
BirdIDCount %>% count(n)

# How many repeats are there per bird per year?
Each_bird_repeats <- d %>% group_by(BirdID, Year) %>%
  summarise(n_measurements = n(), .groups = "drop")

# How many individuals did we capture per year for each sex? Compute the numbers, devise a useful table format, and fill it in.
Cap_sex_year <- d %>% group_by(Year,Sex) %>% 
  summarise(n_measurements = n(), .groups = "drop")

Cap_sex_year$n_numbers <- as.numeric(Cap_sex_year$n_measurements)
Cap_sex_year$n_Year <- as.numeric(Cap_sex_year$Year)
Cap_sex_year$Sex <- as.factor(Cap_sex_year$Sex)



# Think about how you can communicate (1) and (2) best in tables, and how you can
# visualise (1) and (2) using plots. Produce several solutions, and discuss with GTA
# and your peers which the pros and cons for each solution to communicate and
# visualize the data structure for (1) and (2).

ggplot(Each_bird_repeats, aes(x = Year, y = n_measurements)) +
  geom_point(alpha = 0.6, color = "steelblue", size = 2) +
  geom_smooth(method = "loess", color = "red", se = TRUE, span = 0.8) +
  labs(
    title = "Number of Measurements per Bird per Year",
    x = "Year",
    y = "Number of Measurements (n_count)",
    caption = "Each point = one bird in one year"
  ) +
  theme_minimal(base_size = 14) +
  scale_x_continuous(breaks = seq(2000, 2010, 1))

ggplot(Cap_sex_year, aes(x = Year, y = n_measurements, colour = Sex, group = Sex)) +
  geom_line(size = 1.2) +
  geom_point(size = 3) +
  scale_colour_manual(values = c("#1f78b4","#e31a1c")) +
  labs(title = "Unique individuals captured per year (line plot)",
       x = "Year", y = "Number of unique birds") +
  theme_minimal()

############################

Tarsustally <- d %>% count(Tarsus, sort = TRUE)

############################

b<-read.table("../Data/BTLD.txt", header=T)
str(b)

############################

TailLength<-rnorm(500,mean=3.8, sd=2)
summary(TailLength)

#Calculate the standard error of Tarsus, Mass, Wing and Bill length of the complete population sample (as opposed to all sparrows in this world)

SE_Tarsus <- sd(d_c$Tarsus)/sqrt(length(d_c$Tarsus))
SE_Mass <- sd(d_c$Mass)/sqrt(length(d_c$Mass))
SE_Wing <- sd(d_c$Wing)/sqrt(length(d_c$Wing))
SE_BillLength <- sd(d_c$Bill)/sqrt(length(d_c$Bill))

d1<-subset(d_c, d_c$Year==2001) # Too many NA values in 2001 data
SE_Tarsus_2001 <- sd(d1$Tarsus, na.rm = TRUE)/sqrt(length(d1$Tarsus))
SE_Mass_2001 <- sd(d1$Mass)/sqrt(length(d1$Mass))
SE_Wing_2001 <- sd(d1$Wing)/sqrt(length(d1$Wing))
SE_BillLength_2001 <- sd(d1$Bill)/sqrt(length(d1$Bill))

# Sample mass across sparrow data
d_mass <- subset(d, d$Mass != "NA")
SE = c()
Mu = c()
for (i in 1:length(d_mass$Mass)){
  d = sample(d_mass$Mass,i,replace = FALSE)
  Mu[i] = mean(d_mass$Mass)
  SE[i] = sd(d_mass$Mass)/sqrt(i)
}

up <- Mu+SE
down <- Mu-SE
plot(1:length(d_mass$Mass),mean(d_mass$Mass)+0*(1:1704), cex=0.03, ylim=c(25,31),xlim=c(0,1800), xlab="Sample size n", ylab="
Mean of tail length ±SE (m)", col="red")
points(1:1704,Mu,cex=0.3, col="red")
segments(1:1704, up, x1=1:1704, y1=down, lty=1)

################################ 
#1
d_Wing_2001 <- subset(d, d$Year==2001)
d_Wing_2001 <- d_Wing_2001 %>% filter(!is.na(Wing))
d_Wing <- d %>% filter(!is.na(Wing))
A = t.test(d_Wing$Wing,d_Wing_2001$Wing)

dW2_female <- d_Wing_2001 %>% filter(Sex.1 == "female")
dW2_male <- d_Wing_2001 %>% filter(Sex.1 == "male")
B = t.test(dW2_female$Wing,dW2_male$Wing)

d_female <- d_Wing %>% filter(Sex.1 == "female")
d_male <- d_Wing %>% filter(Sex.1 == "male")
C = t.test(d_female$Wing,d_male$Wing)

d_Tarsus <- d %>% filter(!is.na(Tarsus))
dT_female <- d_Tarsus %>% filter(Sex.1 == "female")
dT_male <- d_Tarsus %>% filter(Sex.1 == "male")
D = t.test(dT_female$Tarsus, dT_male$Tarsus)

Ttest_report <- list(A,B,C,D)
#2 quite similar to #1 so skipped. 
#3 Example with Mass on test
d_First5_mass <- d %>% filter(!is.na(Mass)) %>% filter(Year<=2004)
d_Later6_mass <- d %>% filter(!is.na(Mass)) %>% filter(Year>2004)
t.test(d_First7_mass$Mass,d_Later6_mass$Mass)
