install.packages("miniCRAN")
install.packages("igraph")

# check that it works
library("miniCRAN")

CRAN_mirror <- c(CRAN = "https://mran.microsoft.com")
CRAN_mirror <- c(CRAN = "https://cran.cnr.berkeley.edu")

pkgs_needed <- c("randomForest")

plot(makeDepGraph(pkgs_needed))