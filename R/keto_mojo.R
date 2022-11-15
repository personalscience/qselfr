

#' @title Read a Keto Mojo CSV file as a dataframe
#' @param filename path to a properly formatted Keto Mojo CSV file.
#' @returns dataframe
keto_mojo_df <- function(filename) {
  km_df <- readr::read_csv(filename,
                  col_types=cols(
                    source = col_character(),
                    type = col_character(),
                    value = col_double(),
                    unit = col_character(),
                    date = col_character(),
                    time = col_time(format = ""),
                    timeZone = col_character(),
                    gki = col_logical(),
                    hematocrit = col_logical(),
                    hemoglobin = col_logical(),
                    tags = col_character(),
                    notes = col_character(),
                    readingSampleType = col_character()
                  ))
  return(km_df)


}
