#'Add a "Cluster" column to a VSGSeq results data frame.
#'
#'
#'Take a "cluster_reference" data frame that has the VSG name and its
#'corresponding cluster produced from cd hit and to add a column to a VSGSeq
#'results data frame of the cluster for each VSG.
#'
#'@param vsg_results_df This should be some kind of VSGSeq results data frame
#'  that has minimally a column with 'VSG' in it.
#'@param cluster_reference This is a reference table (Needs to be tab delimited)
#'  that has the 'VSG' and the corresponding cluster name/number. The 'VSG' here
#'  needs to match the 'VSG' name in the vsg_results_df. (I create this
#'  reference using my 'MatchVSGs.py' script)
#'
#'@return Returns the vsg_results_df with a column labeled 'Clusgter' and has
#'  the cluster name for each VSG produced by cd-hit.
#'@export
#'
#' @examples
#' vsg_rename(results_df, "cluster_reference_table.txt")
vsg_rename <- function(vsg_results_df, cluster_reference, ref_header = FALSE) {
  if (exists(cluster_reference) != TRUE) {
    cluster_reference <- utils::read.delim(cluster_reference,
                                    header= ref_header)
    colnames(cluster_reference) = c('VSG','cluster')
    dplyr::left_join(vsg_results_df, cluster_reference)
  } else {
    colnames(cluster_reference) = c('VSG','cluster')
    dplyr::left_join(vsg_results_df, cluster_reference)
  }
}
