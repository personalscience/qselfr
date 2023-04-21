

#' @title Return a canonical Inside Tracker blood test results dataframe
#' @param filename path to an Inside Tracker CSV file
#' @export
#' @returns dataframe
inside_tracker_df <- function(filename = system.file("extdata",
                                                     package = "qselfr",
                                                     "InsideTrackerSample.csv")) {
  inside_tracker_raw <- readr::read_csv(filename, col_types = "c") %>%
    tibble::rownames_to_column()  %>%
    tidyr::gather(var, value, -rowname)   %>%
    tidyr::spread(rowname, value)

  # pull out markers and units as separate char vectors
  marker_names <- inside_tracker_raw  %>% dplyr::filter(var == "Marker name") %>% unlist() %>% as.vector()
  markers <- stringr::str_extract(marker_names, pattern = ".+?(?=\\()") %>% stringr::str_trim()
  marker_units <- stringr::str_extract(marker_names[-1], "\\([^()]+\\)") %>% substring(2, nchar(.)-1)

  # Change labs_all to have correct column names
  labs_all <- inside_tracker_raw %>% dplyr::filter(var != "Marker name")
  names(labs_all) <- marker_names
  names(labs_all)[1] <- "Date"
  labs_all$Date <- parse_date(labs_all$Date, format = "%b %d %Y")



  labs <-

    labs_all  %>% select(-c("Neutrophils (cells/µL)", "Lymphocytes (cells/µL)")) %>%
    mutate(across(-Date, ~ replace(., . == "-", NA) %>% as.numeric())) %>%
    arrange(desc(Date))


  return(labs)
}


#' @title Pretty plot of Inside Tracker dataframe
#' @param dataframe canonical inside tracker dataframe
inside_tracker_plot <- function(df) {






lipids_all<- full_join(blood_history_old,
                       labs %>%
                         select(Date,
                                TC = "Total cholesterol (mg/dL)",
                                LDL = "LDL (mg/dL)" ,
                                HDL = "HDL (mg/dL)" ,
                                Triglycerides = "Triglycerides (mg/dL)" ))

lipids <- lipids_all %>% filter(!is.na(Date) & !is.na(LDL))  %>%
  pivot_longer(-Date, names_to = "Marker", values_to = "Value")

lipids %>%
  ggplot(aes(x=Date, y = Value)) +
  geom_line(aes(color = Marker)) +
  labs(title = "R Sprague Cholesterol",
       y = "mg/dL",
       x = NULL) +

  geom_segment(aes(y=300,yend=300, x=as_date("2001-07-01"),
                   xend=as_date("2011-08-01")), color = "blue",
               arrow=arrow(ends="both")) +

  annotate("text", x=as_date("2006-07-01"), y = 330, label = "20 mg simvastatin") +

  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


}
