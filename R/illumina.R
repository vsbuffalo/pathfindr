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
