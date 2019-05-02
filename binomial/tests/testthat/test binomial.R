
library(binomial)
library(ggplot2)
source("/Users/a123/Desktop/computing with data/workout3/binomial/R")
context("test binomial")

n=5
k1=c(1,2,34,5)
k2=2
k3=1:3
test_that("test bin_choose", {
  #expect_length(bin_choose(n,k), 1)
  expect_equal(bin_choose(n,k2), 10)
  expect_length(bin_choose(n,k3),3)
  expect_error(bin_choose(n,k1),"k cannot be greater than n")
})


s=2
trial=5
prob=0.5
s2=0:2
prob2=0.45
s3=4:10
trials=5
test_that("test bin_probability", {
  #expect_length(bin_choose(n,k), 1)
  expect_equal(bin_probability(s,trial,prob), 0.3125)
  expect_length(bin_probability(s2,trials,prob),3)
  expect_error(bin_probability(s3,trials,prob),"success cannot be greater than trials")
})


trials=5
prob=0.5
prob2=0.45
trials=5
test_that("test bin_distribution", {
  #expect_length(bin_choose(n,k), 1)
  expect_is(bin_distribution(trials,prob), c("bindis","data.frame"))
  expect_equal(nrow(bin_distribution(trials,prob2)),6)
  expect_named(bin_distribution(trials,prob),c("success","probability"))
})

trials=5
prob=0.5
prob2=0.45
trials=5
test_that("test bin_cumulative", {
  #expect_length(bin_choose(n,k), 1)
  expect_is(bin_cumulative(trials,prob), c("bincum","data.frame"))
  expect_equal(round(bin_cumulative(trials,prob2)[2,2],3),0.206)
  expect_named(bin_cumulative(trials,prob),c("success","probability","cumulative"))
})
