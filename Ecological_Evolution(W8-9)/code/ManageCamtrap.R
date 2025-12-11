install.packages("camtrapR")
install.packages("taxize")
install.packages("overlap")
install.packages("exiftoolr")

library(camtrapR)
library(taxize)
library(overlap)
library(exiftoolr)

Sys.which("exiftool")
imageRename(inDir = "../data", outDir = "../renamed_data", keepCameraSubfolders = F, hasCameraFolders = F, copyImages = T)
