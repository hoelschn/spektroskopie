rm(list=ls())

#Enable selection of file
print("Experimentkürzel eingeben")
exp <- readLines(n=1)
print("Messnummer?")
num <- readLines(n=1)
filename <- paste(sep="","Data/group15_",exp,"_",num,".xl")

#Read data from files
data <- read.table(filename, sep=",", header=TRUE, skip=1)

#Configure matrix dimensions
ncol <- length(data[1,])
nrow <- length(data[,1])

#Rearrange data
time <- data[,1]
dummy <- data[,5]+1
elements <- data[0,(2:ncol)]
intensity <- matrix(NA,nrow=nrow,ncol=ncol-1)
for(i in 1:ncol-1){
  intensity[,i] <- data[,i+1]
}

#Plot data
plot(time,dummy,type="n",ylim=c(1e+03,1e+07),log="y")
matlines(time,intensity,type="l",lty="solid")

#print(intensity)
print(is.matrix(intensity))
print(is.matrix(data))

#print(elements)