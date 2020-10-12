#'Find the highest expressed VSG
#'
#'Find the most highly expressed VSG in a designated group.
#'
#'@param df A data frame, usually containing VSGSeq results data.
#'@param  ... A set of columns to 'group_by'. These arguments are passed into
#'  dplyr::group_by function.
#'
#'@return Returns a date frame with the rows of VSGs with the maximum Percent
#'  value based on the group_by arguments.
#'@export
#'
#' @examples
#' vsg_max(results_df, mouse, tissue, day)
vsg_max <- function(df,...) {
  df %>%
    group_by(...) %>%
    filter(Percent == max(Percent)) %>%
    ungroup()
}
