install.packages("birdnetR")
library(birdnetR)

# Initialise a BirdNET model
model <- birdnet_model_tflite("v2.4")

## First run Monkswood
# Set path to the folder with WAV files
folder_path <- "~/Documents/CMEECourseWork/Ecological_Evolution/data/Data"

# List all WAV files
wav_files <- list.files(folder_path, pattern = "\\.wav$", full.names = FALSE)

# Filter only dawn chorus wav files 
# Remove prefix and extract date/time
df <- data.frame(filename = wav_files) %>%
  mutate(
    clean_name = str_remove(filename, "^2MM[0-9]+_"),               # remove 2MMXXXXX_
    date_raw   = str_extract(clean_name, "^\\d{8}"),              # extract 20251009
    time_raw   = str_extract(clean_name, "(?<=_)\\d{6}"),         # extract 000500
    datetime   = as.POSIXct(paste0(date_raw, time_raw), format = "%Y%m%d%H%M%S"),
    date_fmt   = format(datetime, "%m.%d"),                       # 10.09
    time_fmt   = format(datetime, "%I:%M %p")                     # 12-hour format, e.g. 00:05 AM
  )

library(lubridate)

df_filtered <- df %>%
  filter(hour(datetime) >= 7 & hour(datetime) < 9)

write.csv(df_filtered, "Sb.csv")

# Loop through each WAV file and run predictions
group8_all_predictions <- lapply(df_filtered$filename, function(f) {
  preds <- predict_species_from_audio_file(model, f)
  # Add filename as a new column
  preds$file <- basename(f)
  return(preds)
})

# Combine into one dataframe
group8_all_predictions_df <- do.call(rbind, group8_all_predictions)

## Now run Parsonage
# Path to the folder with WAV files
folder_path <- "~/Documents/CMEECourseWork/Ecological_Evolution/data/Parsonage_dawn"

# List all WAV files
wav_files <- list.files(folder_path, pattern = "\\.wav$", full.names = TRUE)

# Loop through each WAV file and run predictions
Parsonage_all_predictions <- lapply(wav_files, function(f) {
  preds <- predict_species_from_audio_file(model, f)
  # Add filename as a new column
  preds$file <- basename(f)
  return(preds)
})

# Combine into one dataframe
Parsonage_all_predictions_df <- do.call(rbind, Parsonage_all_predictions)

#set your wd and save the files
setwd("~/Documents/CMEECourseWork/Ecological_Evolution/results")
write.csv(Monkswood_all_predictions_df, "BirdNET_Monkswood.csv")
write.csv(Parsonage_all_predictions_df, "BirdNET_Parsonage.csv")
