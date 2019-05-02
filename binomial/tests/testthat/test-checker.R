context("test checker")
library(binomial)
source("/Users/a123/Desktop/computing with data/workout3/binomial/R")


x1=-1
x2=0.3
x3=1.2
test_that("test prob", {
  expect_length(check_prob(x2), 1)
  expect_equal(check_prob(x2), TRUE)
  expect_error(check_prob(x3), "invalid prob value")
})

x1=10
x2=0.5
x3=-1
test_that("test trials", {
  expect_equal(check_trials(x1), TRUE)
  expect_error(check_trials(x2), "invalid trials value")
  expect_error(check_trials(x3),"invalid trials value")
})

success=c(1,2,3,4)
trials=10
success2=c(2,3,4,5)
trials2=1
success3=0.4
trials3=10
test_that("test success", {
  expect_equal(check_success(success,trials), TRUE)
  expect_error(check_success(success2,trials2), "success cannot be greater than trials")
  expect_error(check_success(success3,trials3),"invalid success value")
})



