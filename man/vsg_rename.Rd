% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vsg_rename.R
\name{vsg_rename}
\alias{vsg_rename}
\title{Add a "Cluster" column to a VSGSeq results data frame.}
\usage{
vsg_rename(vsg_results_df, cluster_reference, ref_header = FALSE)
}
\arguments{
\item{vsg_results_df}{This should be some kind of VSGSeq results data frame
that has minimally a column with 'VSG' in it.}

\item{cluster_reference}{This is a reference table (Needs to be tab delimited)
that has the 'VSG' and the corresponding cluster name/number. The 'VSG' here
needs to match the 'VSG' name in the vsg_results_df. (I create this
reference using my 'MatchVSGs.py' script)}
}
\value{
Returns the vsg_results_df with a column labeled 'Clusgter' and has
the cluster name for each VSG produced by cd-hit.
}
\description{
Take a "cluster_reference" data frame that has the VSG name and its
corresponding cluster produced from cd hit and to add a column to a VSGSeq
results data frame of the cluster for each VSG.
}
\examples{
vsg_rename(results_df, "cluster_reference_table.txt")
}
