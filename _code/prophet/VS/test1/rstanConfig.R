dotR <- file.path(Sys.getenv("HOME"), ".R")
if (!file.exists(dotR))
	dir.create(dotR)
M <- file.path(dotR, "Makevars")
if (!file.exists(M))
	file.create(M)
cat("\nCXXFLAGS=-O3 -Wno-unused-variable -Wno-unused-function",
	file = M, sep = "\n", append = TRUE)

cat('Sys.setenv(BINPREF = "C:/Rtools/mingw_$(WIN)/bin/")',
	file = file.path(Sys.getenv("HOME"), ".Rprofile"),
	sep = "\n", append = TRUE)

cat(readLines(M), sep = "\n")



lib.dir <- "C:\\Program Files\\Microsoft SQL Server\\140\\R_SERVER\\library"
install.packages("rstan", lib = lib.dir, repos = "https://cloud.r-project.org/", dependencies = TRUE)


library("rstan")

fx <- inline::cxxfunction(signature(x = "integer", y = "numeric"), '
	return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;
')
fx(2L, 5) # should be 10


lib.dir <- "C:\\Program Files\\Microsoft SQL Server\\140\\R_SERVER\\library"
install.packages("prophet", lib = lib.dir, repos = "https://cloud.r-project.org/", dependencies = TRUE)

remove.packages("prophet")

remove.packages("prophet", lib = lib.dir)
