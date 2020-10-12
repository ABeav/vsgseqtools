#'Splits a samplename column into three columns, mouse, day, and tissue (mdt).
#'
#'I kept having to do this so I made a function to split my usualy samplename
#'nomenclature into the designated mouse, day, adn tissue columns (mdt).
#'
#'@param df A data frame, usually containing VSGSeq results data.
#'@param  col_to_split The column to split, usually a samplename column.
#'@param by The character to split by. The default is an underscore ("_").
#'@param convert If TRUE, will run type.convert() with as.is = TRUE on new
#'  columns. This is useful if the component columns are integer, numeric or
#'  logical.
#'
#'@return Returns a date frame with the designate column split into mouse, day, and tissue columns.
#'@export
#'
#'@examples
#'vsg_split_mdt("samplename")
vsg_split_mdt <- function(df, col_to_split, by = "_",convert = TRUE) {

  col_to_split = as.name(col_to_split)
  df %>%
    tidyr::separate(col_to_split, c("mouse", "day", "tissue"), by, remove = FALSE, convert = convert)
}
