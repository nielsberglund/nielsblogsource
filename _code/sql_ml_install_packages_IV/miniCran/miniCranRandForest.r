
library("miniCRAN")

CRAN_mirror <- c(CRAN = "https://mran.microsoft.com")
CRAN_mirror <- c(CRAN = "https://cran.cnr.berkeley.edu")

pkgs_needed <- c("randomForest")

# visual representation of pkg dependencies
 plot(makeDepGraph(pkgs_needed))

# dependent packages
pkgs_expanded <- pkgDep(pkgs_needed, repos = CRAN_mirror)

local_repo <- "W:/minicran/miniCranRandFor"

# download the packages
makeRepo(pkgs_expanded, path = local_repo, repos = CRAN_mirror, type = "win.binary", Rversion = "3.3");