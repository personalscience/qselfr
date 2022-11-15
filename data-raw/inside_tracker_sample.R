## code to prepare `inside_tracker_sample` dataset goes here

inside_tracker_sample <- readr::read_csv(system.file("extdata",
                                                     package = "qselfr",
                                                     "InsideTrackerSample.csv"))

usethis::use_data(inside_tracker_sample, overwrite = TRUE)
