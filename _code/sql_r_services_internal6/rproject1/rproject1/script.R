test1 <- function() {
	pid <- Sys.getpid()
	d <- getwd()
	print(paste("ProcessId: ", pid, ", WorkingDir: ", d, sep = ""))
}