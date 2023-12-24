install.packages("readmet")

library("readmet")

dat <- read.toa5("data/fluxes_201415/TOA5_2806.ts_data.dat")
dat$time <- as.POSIXct(dat$TIMESTAMP)
write.csv(dat, "data/fluxes_201415/TOA5_2806.ts_data.dat.csv")
