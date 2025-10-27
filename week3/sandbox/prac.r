wing.width.cm <- 1.2 #Using dot notation
wing.length.cm <- c(4.7, 5.2, 4.8)
wing.length
a = T
v2 = character(3)
v3 = numeric(3)
arr1 <- array(1:50, c(5, 5, 2))
arr1[,,1]
arr1
MyList <- list(species=c("Quercus robur","Fraxinus excelsior"), age=c(123, 84))
MyList
x <- c(1,2); y <- c(5,3,9,2)
x;y
x + y
x + c(y,1)
runif(20, min=0, max=2)

MyData <- read.csv("../data/trees.csv")
ls(pattern = "My*") # Check that MyData has appeared
write.csv(MyData, "../results/MyData.csv")
dir("../results/") # Check if it worked
write.table(MyData[1,], file = "../results/MyData.csv",append=TRUE) # append

# Data management and visualization
MyData <- as.matrix(read.csv("../data/PoundHillData.csv",header = FALSE))
class(MyData)
MyMetaData <- read.csv("../data/PoundHillMetaData.csv",header = TRUE,  sep=";")
class(MyMetaData)
head(MyData)
