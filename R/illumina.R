extract_illumina <- function(paths) {
    cols <- c("sample_name", "barcode_sequence", "lane", "read_number", "set_number")
    metadata <- extract_metadata(paths,
                                 "\\w+_L\\d{3}_R\\d_\\d{3}.fastq.gz",
                                 cols)
    validate_functions <- list(sample_name=is.character,
                               barcode_sequence=is.barcode,
                               lane=is.integer,
                               read_number=is.integer,
                               set_number=is.integer)
    validated <- validate_metadata(metadata, validate_functions)
}

illumina_self_contained <- function(paths) {
    cols <- c("sample_name", "barcode_sequence", "lane", "read_number", "set_number")
    paths <- basename(paths[grep("\\w+_L\\d{3}_R\\d_\\d{3}.fastq.gz", paths)])

    parsed <- strsplit(paths, "_")
    sample_name <- sapply(parsed, function(x) x[1])
    read <- sapply(parsed, function(x) x[length(x)-1])
    lane <- sapply(parsed, function(x) x[length(x)-2])
    barcode <- sapply(parsed, function(x) paste(x[2:(length(x)-3)], collapse="_"))
    set_num <- sapply(parsed, function(x) {
        y <- x[length(x)]
        return(strsplit(y, ".", fixed=TRUE)[[1]][1])
    })
    retval <- data.frame(sample_name, barcode, lane, read, set_num)
    colnames(retval) <- cols
    return(retval)
}
