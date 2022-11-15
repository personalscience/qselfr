

km <- sample_keto_data

test_that("keto dataframe names are correct", {
  expect_equal(names(km)[3],"value")
})

