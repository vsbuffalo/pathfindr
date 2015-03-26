## metadata.R -- extract metadata


#' Extract metadata from a structured file path
#'
#' This might be more internal; we can wrap this with friendly functions rather
#' than having users write a regex.
#' 
#' @param paths character vector of filenames.
#' @param regex a rege that matches files.
#' @param cols colunn names for groups captured in \code{regex}.
#' @param validate a named list of functions (names indicate cols) that validate metadata (e.g. is an integer, is date, etc.).
#' 
#' @export
extract_metadata <- function(paths, regex, cols, validate) {

}
