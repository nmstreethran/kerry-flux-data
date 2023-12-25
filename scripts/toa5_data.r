# process TOA5 data

# TOA5_2806.ts_data.dat
# split large (~28 mil rows, ~3 GB) TOA5 file into manageable
# (max. 1 mil rows, ~110 MB) files

# read TOA5 dataset
data <- read.csv("data/TOA5/TOA5_2806.ts_data.dat", skip = 4, header = FALSE)

# extract headers
headers <- read.csv(
  "data/TOA5/TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 3
)

# save headers
write.table(
  headers, "data/CSV/TOA5_2806.ts_data.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

# assign column names
names(data) <- as.matrix(
  read.csv(
    "data/TOA5/TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 1
  )
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

# TOA5_1541.ts_data.dat
# split TOA5 file (~28 mil rows, 2.6 GB) into max. 1 mil row files

data <- read.csv("data/TOA5/TOA5_1541.ts_data.dat", skip = 4, header = FALSE)

headers <- read.csv(
  "data/TOA5/TOA5_1541.ts_data.dat", skip = 1, header = FALSE, nrows = 3
)

write.table(
  headers, "data/CSV/TOA5_1541.ts_data.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

names(data) <- as.matrix(
  read.csv(
    "data/TOA5/TOA5_1541.ts_data.dat", skip = 1, header = FALSE, nrows = 1
  )
)

data_split <- split(data, (as.numeric(rownames(data)) - 1) %/% 1000000)

for (n in seq_along(data_split)) {
  write.table(
    data_split[[n]],
    paste(
      "data/CSV/TOA5_1541.", "ts_data.", sprintf("%02d", n), ".csv", sep = ""
    ),
    row.names = FALSE, sep = ",", quote = FALSE
  )
}

# TOA5_3989.ts_data.dat
# split TOA5 file (~5.6 mil rows, ~500 MB) into max. 1 mil row files

data <- read.csv("data/TOA5/TOA5_3989.ts_data.dat", skip = 4, header = FALSE)

headers <- read.csv(
  "data/TOA5/TOA5_3989.ts_data.dat", skip = 1, header = FALSE, nrows = 3
)

write.table(
  headers, "data/CSV/TOA5_3989.ts_data.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

names(data) <- as.matrix(
  read.csv(
    "data/TOA5/TOA5_3989.ts_data.dat", skip = 1, header = FALSE, nrows = 1
  )
)

data_split <- split(data, (as.numeric(rownames(data)) - 1) %/% 1000000)

for (n in seq_along(data_split)) {
  write.table(
    data_split[[n]],
    paste(
      "data/CSV/TOA5_3989.", "ts_data.", sprintf("%02d", n), ".csv", sep = ""
    ),
    row.names = FALSE, sep = ",", quote = FALSE
  )
}

# TOA5_3989.flux.dat

data <- read.csv("data/TOA5/TOA5_3989.flux.dat", skip = 4, header = FALSE)

headers <- read.csv(
  "data/TOA5/TOA5_3989.flux.dat", skip = 1, header = FALSE, nrows = 3
)

write.table(
  headers, "data/CSV/TOA5_3989.flux.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

names(data) <- as.matrix(
  read.csv("data/TOA5/TOA5_3989.flux.dat", skip = 1, header = FALSE, nrows = 1)
)

write.table(
  data, "data/CSV/TOA5_3989.flux.csv", row.names = FALSE,
  sep = ",", quote = FALSE
)

# TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2015).dat

data <- read.csv(
  "data/TOA5/TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2015).dat",
  skip = 4, header = FALSE
)

headers <- read.csv(
  "data/TOA5/TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2015).dat",
  skip = 1, header = FALSE, nrows = 3
)

write.table(
  headers, "data/CSV/TOA5_3989.2015.flux.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

names(data) <- as.matrix(
  read.csv(
    "data/TOA5/TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2015).dat",
    skip = 1, header = FALSE, nrows = 1
  )
)

write.table(
  data, "data/CSV/TOA5_3989.2015.flux.csv", row.names = FALSE,
  sep = ",", quote = FALSE
)

# TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2016).dat

data <- read.csv(
  "data/TOA5/TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2016).dat",
  skip = 4, header = FALSE
)

headers <- read.csv(
  "data/TOA5/TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2016).dat",
  skip = 1, header = FALSE, nrows = 3
)

write.table(
  headers, "data/CSV/TOA5_3989.2016.flux.headers.csv", row.names = FALSE,
  col.names = FALSE, sep = ",", quote = FALSE
)

names(data) <- as.matrix(
  read.csv(
    "data/TOA5/TOA5_3989.flux (2021_09_17 14_49_19 UTC) (2016).dat",
    skip = 1, header = FALSE, nrows = 1
  )
)

write.table(
  data, "data/CSV/TOA5_3989.2016.flux.csv", row.names = FALSE,
  sep = ",", quote = FALSE
)
