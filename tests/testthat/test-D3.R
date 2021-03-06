context("D3")
imp <- mice(nhanes, print = FALSE, m = 10, seed = 219)

fit1 <- with(data = imp, expr = lm(hyp ~ age + chl))
fit0 <- with(data = imp, expr = lm(hyp ~ 1))
empty <- with(data = imp, expr = lm(hyp ~ 0))

stat1 <- pool.compare(fit1, fit0, method = "likelihood")

z1 <- D3(fit1, fit0)
z2 <- mitml::testModels(as.mitml.result(fit1), as.mitml.result(fit0), method = "D3")

# This test fails
# FIXME
# test_that("lm: mice and mitml calculate same F", {
#   expect_equal(z1$Dm, unname(z2$test[1, "F.value"]))
# })


# using lmer
suppressPackageStartupMessages(library(mitml, quietly = TRUE))
library(lme4, quietly = TRUE)
data(studentratings)
fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
set.seed(26262)
imp <- mitml::panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5,
                 silent = TRUE)
implist <- mitmlComplete(imp, print=1:5)
fit0 <- with(implist, lmer(ReadAchiev ~ (1|ID), REML=FALSE))
fit1 <- with(implist, lmer(ReadAchiev ~ ReadDis + SES + (1|ID), REML=FALSE))

# likelihood test
z3 <- D3(fit1, fit0)
z4 <- testModels(fit1, fit0, method = "D3")

# This test fails.
# FIXME
# test_that("lmer: mice and mitml calculate same F", {
#   expect_equal(z3$Dm, unname(z4$test[1, "F.value"]))
# })


# glm
# imp <- mice(nhanes2, print = FALSE, m = 10, seed = 219)
# 
# fit1 <- with(data = imp, expr = glm(hyp == "yes" ~ age + chl, family = binomial))
# fit0 <- with(data = imp, expr = glm(hyp == "yes" ~ 1, family = binomial))
# empty <- with(data = imp, expr = glm(hyp == "yes" ~ 0, family = binomial))
# 
# model dev1.L does not look right, negative Dm, convergence problems
# FIXME
# z5 <- D3(fit1, fit0)

# mitml can't do this case
# z6 <- mitml::testModels(as.mitml.result(fit1), as.mitml.result(fit0), method = "D3")

# crashes on terms
# FIXME
# z5a <- D3(fit1, empty)

# This test fails.
# FIXME
# test_that("glm: mice and mitml calculate same F", {
#   expect_equal(z5$Dm, unname(z6$test[1, "F.value"]))
# })


# data with factors
imp <- mice(nhanes2, print = FALSE, m = 10, seed = 219)
fit1 <- with(data = imp, expr = lm(bmi ~ age + chl + hyp))
fit0 <- with(data = imp, expr = lm(bmi ~ age))
empty <- with(data = imp, expr = lm(bmi ~ 0))

z7 <- D3(fit1, fit0)
z8 <- mitml::testModels(as.mitml.result(fit1), as.mitml.result(fit0), method = "D3")

# This test fails.
# FIXME
# test_that("factors: mice and mitml calculate same F", {
#   expect_equal(z7$Dm, unname(z8$test[1, "F.value"]))
# })
