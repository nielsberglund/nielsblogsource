iris_dataset <- iris
setosa <- iris[iris$Species == "setosa",]
meanSepWidth <- mean(setosa$Sepal.Width)
cat(paste("Seposa sepal mean width: ", meanSepWidth))