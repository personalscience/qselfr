

in_file <- system.file("extdata",
                       package = "qselfr",
                       "InsideTrackerSample.csv")

in_df <- inside_tracker_df(in_file) # suppressWarnings(inside_tracker_df(in_file))
test_that("inside tracker reads", {
  expect_equal(as.numeric(in_df[5,5]), 143)
})


test_that("inside_tracker_df columns except Date are numeric", {
  expect_s3_class(select_if(in_df, is.numeric), "data.frame")
})


