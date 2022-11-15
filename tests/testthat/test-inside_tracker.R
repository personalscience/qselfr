

in_file <- system.file("extdata",
                       package = "qselfr",
                       "InsideTrackerSample.csv")

in_df <- suppressWarnings(inside_tracker_df(in_file))
test_that("inside tracker reads", {
  expect_equal(as.numeric(in_df[5,5]), 143)
})
