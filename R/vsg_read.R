#' Correctly read in VSG Seq results files
#'
#' Read in a tab delimited VSG seq results file into R with correct column
#' specifications.
#'
#' @param filename tab delimited results file produced by the VSGSeqPipeline.
#'   Usually called "RESULTS.txt".
#' @param samplename A logical argument to drop the ".fq" from your samplenames.
#'   TRUE drops the ".fq".
#'
#' @return Returns a tibble of the input VSG Seq results file with correctly
#'   identified column types.
#' @export
#'
#' @examples
#' vsg_read("RESULTS.txt")
vsg_read <- function(filename, samplename = TRUE) {
  if (stringr::str_detect(filename, ".txt") != TRUE) {
    warning("This does not look like a VSGSeq results file.")
  }
  filename <- readr::read_tsv( filename ) %>%
    dplyr::filter( file != "file") %>%
    dplyr::mutate( Percent = readr::parse_number(Percent),
            RPKM = readr::parse_number(RPKM),
            dplyr::across(pct_id_vs_query:assembled_VSG_length, parse_number)) # TODO: I can do this stuff in the read in step
  if ( samplename == TRUE ) {
    tidyr::separate(filename, file, "samplename", sep = ".fq", convert = TRUE) # TODO: figure out how to make this also separate based on ".fastq".
  } else {
    return(filename)
  }
}
