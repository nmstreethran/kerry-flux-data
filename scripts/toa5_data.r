# split large (~28 mil rows, ~3 GB) TOA5 file into manageable
# (max. 1 mil rows, ~110 MB) files

# read TOA5 dataset
data <- read.csv("data/TOA5/TOA5_2806.ts_data.dat", skip = 4, header = FALSE)

# assign column names
names(data) <- as.matrix(
  read.csv(
    "data/TOA5/TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 1
  )
)

# extract headers
headers <- read.csv(
  "data/TOA5/TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 3
)

# save headers
write.table(
  headers, "data/CSV/TOA5_2806.ts_data.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

# split data into manageable chunks (1 mil rows)
data_split <- split(data, (as.numeric(rownames(data)) - 1) %/% 1000000)

# save each chunk as a new CSV file
for (n in seq_along(data_split)) {
  write.table(
    data_split[[n]],
    paste(
      "data/CSV/TOA5_2806.", "ts_data.", sprintf("%02d", n), ".csv", sep = ""
    ),
    row.names = FALSE, sep = ",", quote = FALSE
  )
}
