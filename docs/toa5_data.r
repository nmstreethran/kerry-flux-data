# split large (~28 mil rows, ~3 GB) TOA5 file into manageable
# (max. 1 mil rows, ~110 MB) files

# read TOA5 dataset
data <- read.csv("TOA5_2806.ts_data.dat", skip = 4, header = FALSE)

# assign column names
names(data) <- as.matrix(
  read.csv("TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 1)
)

# extract headers
headers <- read.csv(
  "TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 3
)

# save headers
write.table(
  headers, "TOA5_2806.headers.csv", row.names = FALSE, col.names = FALSE,
  sep = ",", quote = FALSE
)

# split data into manageable chunks (1 mil rows)
data_split <- split(data, (as.numeric(rownames(data)) - 1) %/% 1000000)

# save each chunk as a new CSV file
for (n in 1:length(data_split)) {
  write.table(
    data_split[[n]],
    paste("TOA5_2806.", "ts_data.", sprintf("%02d", n), ".csv", sep = ""),
    row.names = FALSE, sep = ",", quote = FALSE
  )
}
