#'Creates all possible combinations of sample ~ VSG (col1 ~ col2).
#'
#'This takes a VSG seq output data frame and expands it to include all possible
#'combinations of sample ~ VSG (col1 ~ col2). Then resets all Percent values to
#'be zero if a VSG was not found in a sample.
#'
#'@param df A data frame, usually containing VSGSeq results data.
#'@param col1 The first column to expand on, this is typically the samplename
#'  column. (Needs to be in quotes)
#'@param col2 The second column to expand with, this is typically the VSG column
#'  with the name of each VSG.
#'@param merge A logical argument to merge back with the original data to get percent info in the output.
#'
#'@return Returns a date frame with the VSG data for every possible combination of sample ~ VSG (col1 ~ col2)
#'@export
#'
#' @examples
#' vsg_expand(results_df, "samplename", "VSG")
vsg_expand <- function(df, col1, col2, merge = TRUE) {
  col1 <- as.name(col1)
  col2 <- as.name(col2)

  samples <- df %>%
    dplyr::distinct(col1)
  clusters <- df %>%
    dplyr::distinct(col2)

  expanded <- tidyr::expand_grid(samples, clusters)

  if (merge == TRUE) {
    expanded %>%
      dplyr::left_join(df) %>%
      dplyr::mutate(Percent = tidyr::replace_na(Percent, 0))
  } else {
    expanded
  }
}
