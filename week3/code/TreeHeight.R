# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"

# Load the trees.csv 
Treedata <- read.csv("../data/trees.csv")

# Function to calculate tree height 
TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    print(paste("Tree height is:", height))
  
    return (height)
}

# Store tree height results in Height_results
Height_results <- matrix(NA,nrow=120)
for (i in 1 : nrow(Treedata)){
  Height_results[i,1] <- TreeHeight(Treedata$Angle.degrees[i],Treedata$Distance.m[i])
}

# Export the results along with the tree original information from trees.csv
TreesHt <- data.frame(
  Species = Treedata$Species,
  Distance.m = Treedata$Distance.m,
  Angle.degrees = Treedata$Angle.degrees,
  Tree.Height.m = Height_results
)
write.csv(TreesHt, "../results/TreeHts.csv")
