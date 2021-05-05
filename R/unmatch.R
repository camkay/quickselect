#' unmatch
#'
#' `unmatch` extracts columns in a data frame that DO NOT match a specified regex string. 
#' @param .data a data frame or tibble.
#' @param pattern a character string that is used to find the columns of interest. It can be a regular expression.
#' @importFrom dplyr select
#' @importFrom dplyr matches
#' @export
#' 

unmatch <- function(.data, pattern) {
  # "unmatch" columns
  out <- select(.data, -matches(pattern))
  
  # return out
  out
}