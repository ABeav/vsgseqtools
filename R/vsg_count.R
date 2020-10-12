#'Count the number of VSGs in a group.
#'
#'Count the number of VSGs expressed in a designated group of parameters from a
#'VSGSeq output results table.
#'
#'@param df A data frame, usually containing VSGSeq results data.
#'@param  ... A set of columns to 'group_by' and count the number of VSGs. These
#'  arguments are passed into dplyr::group_by function, then a dplyr::count
#'  function is applied.
#'@param keep_all A logical argument. TRUE keeps all the rows and columns
#'  originally put into the function.
#'
#'@return Returns a date frame with the VSG counts based on the input group_by
#'  arguments.
#'@export
#'
#' @examples
#' vsg_count(results_df, mouse, tissue, day)
#' vsg_count(results_df, mouse, tissue, day, keep_all = TRUE)
vsg_count <- function( df, ..., keep_all = FALSE) {
  if (keep_all == FALSE) {
    df %>%
      dplyr::group_by(...) %>%
      dplyr::count() %>%
      dplyr::rename( vsg_count = n ) %>%
      dplyr::ungroup()
  } else {
    df %>%
      dplyr::group_by(...) %>%
      dplyr::add_count() %>%
      dplyr::rename( vsg_count = n ) %>%
      dplyr::ungroup()
  }
}
