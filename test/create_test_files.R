# Each level will be a collection of directories, these names are arbitrary
level_1_dirs <- paste0("dir", 1:10)
level_2_dirs <- paste0("sample-", rep(c("A", "B"), 5), "_year_", sample(1:10))
level_3_dirs <- paste0("country_", rep(c("abc", "efg"), 5), "_machine_", sample(1:1000, size=10))

# Create files in these directories
for(level_1_dir in level_1_dirs) {
    for(level_2_dir in level_2_dirs) {
        for(level_3_dir in level_3_dirs) {
            cur_path <- file.path(level_1_dir, level_2_dir, level_3_dir)
            dir.create(cur_path, recursive=T)
            X <- matrix(rnorm(100), 10, 10)
            write.csv(X, file=file.path(cur_path, paste0(basename(cur_path), ".csv")))
        }
    }
}

################################################################################
# Some variations in file / directory structure
################################################################################

# Add in a rogue file
write.csv(X, file=file.path(cur_path, basename(cur_path), ".test"))

# Add in a directory that didn't belong before
cur_path <- file.path(level_1_dirs[3], level_2_dirs[4], level_3_dirs[1])
extra_path <- file.path(cur_path, "extra_dir")
dir.create(extra_path, recursive=T)
write.csv(X, file=file.path(extra_path, basename(extra_path), "_extra_dir.test"))
