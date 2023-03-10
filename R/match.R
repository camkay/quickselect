#' match
#'
#' `match` extracts columns in a data frame that match a specified regex string.
#' @param .data a data frame or tibble.
#' @param pattern a character string that is used to find the columns of interest. It can be a regular expression.
#' @param ignore.case a logical scalar that specifies whether the case of the string should be ignored when matching. Defaults to `FALSE`. 
#' @importFrom dplyr select
#' @importFrom dplyr matches
#' @export
#' 

match <- function(.data, pattern, ignore.case = FALSE) {
  # match columns
  out <- select(.data, matches(pattern, ignore.case = ignore.case))
  
  # return out
  out
}
