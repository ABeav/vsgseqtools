#'Return the distinct objects of a column as a vector.
#'
#'This function helps the vsg_expand function.
#'
#'@param df A data frame, usually containing VSGSeq results data.
#'@param  ... A set of columns to pass to dplyr::distinct().
#'@param
#'
#'@return Returns a vector of the distinct objects in the column designated.
#'@export
#'
#' @examples
#' vsg_distinct_vectorize(df, col1)
vsg_distinct_vectorize <- function(df, ...) {
  df %>%
    dplyr::distinct(...) %>%
    as.vector()
}
