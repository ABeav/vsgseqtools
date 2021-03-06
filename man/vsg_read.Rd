% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vsg_read.R
\name{vsg_read}
\alias{vsg_read}
\title{Correctly read in VSG Seq results files}
\usage{
vsg_read(filename, samplename = TRUE)
}
\arguments{
\item{filename}{tab delimited results file produced by the VSGSeqPipeline.
Usually called "RESULTS.txt".}

\item{samplename}{A logical argument to drop the ".fq" from your samplenames.
TRUE drops the ".fq".}
}
\value{
Returns a tibble of the input VSG Seq results file with correctly
identified column types.
}
\description{
Read in a tab delimited VSG seq results file into R with correct column
specifications.
}
\examples{
vsg_read("RESULTS.txt")
}
