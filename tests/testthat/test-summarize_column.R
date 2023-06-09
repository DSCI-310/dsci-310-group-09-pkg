#helper functions:
mpg <- print(mtcars[, c("mpg")])
empty_df <- mtcars[FALSE,]
empty_df_output <- data.frame(mean = numeric(0),
                              med = numeric(0),
                              sd = numeric(0))

df_string <- data.frame(player = c("Novak","Rafa","Roger"))

hp <- print(mtcars[, c("hp")])

qsec <- print(mtcars[, c("qsec")])

mpg_output <- data.frame(mean(mpg),
                         median(mpg),
                         sd(mpg))

hp_output <- data.frame(mean(hp),
                        median(hp),
                        sd(hp))

qsec_output <- data.frame(mean(qsec),
                          median(qsec),
                          sd(qsec))

#tests:

testthat::test_that("summarize_column function returns a df or df extension", {
  expect_s3_class(summarize_column(mtcars, mpg), "data.frame")
})

testthat::test_that("summarize_column function returns a df with three columns:
mean, med, sd",{
  expect_equal(colnames(summarize_column(mtcars, mpg)),
                    c("mean","med","sd"))
})


testthat::test_that("summarize_column calculates mean, med, sd correctly", {
  expect_equivalent(summarize_column(mtcars,mpg), mpg_output)
  expect_equivalent(summarize_column(mtcars,hp), hp_output)
  expect_equivalent(summarize_column(mtcars,qsec), qsec_output)
})



testthat::test_that("summarize_column returns an empty df, along with columns:mean,med,
sd if input is an empty df", {
  expect_equal(summarize_column(empty_df, mpg), empty_df_output)
  expect_equal(summarize_column(empty_df, qsec), empty_df_output)
})


# use expect_error() for tests on stop cases

testthat::test_that("summarize_column returns error when input is not df or df extension", {
  expect_error(summarize_column(mtcars, vsd))
  expect_error(summarize_column(mtw, vsd))
  expect_error(summarize_column(324, sdf))
})


testthat::test_that("summarize_column returns error when input is not df or df extension", {
  expect_error(summarize_column(mtcars, rgd))
  expect_error(summarize_column(mtcars, uih))
})


testthat::test_that("summarize_column returns error when input column is not numeric", {
  expect_error(summarize_column(mtcars, df_string))
  expect_error(summarize_column(mtcars, c("esf","gr", 345, "dsfl")))
})

