data <- read.csv("TOA5_2806.ts_data.dat", skip = 4, header = FALSE)

names(data) <- as.matrix(
    read.csv("TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 1)
)

head(data)

headers <- read.csv(
    "TOA5_2806.ts_data.dat", skip = 1, header = FALSE, nrows = 3
)

headers

write.table(
    headers, "TOA5_2806.headers.csv", row.names = FALSE, col.names = FALSE,
    sep = ",", quote = FALSE
)

summary(data)

nrow(data)

data_split <- split(data, (as.numeric(rownames(data)) - 1) %/% 1000000)

str(data_split)

str(data_split[[1]])

str(data_split[[29]])

head(data_split[[1]])

head(data_split[[29]])

nrow(data_split[[1]])

nrow(data_split[[29]])

for (n in 1:length(data_split)) {
    write.table(
        data_split[[n]],
        paste("TOA5_2806.", "ts_data.", sprintf("%02d", n), ".csv", sep = ""),
        row.names = FALSE, sep = ",", quote = FALSE
    )
}
