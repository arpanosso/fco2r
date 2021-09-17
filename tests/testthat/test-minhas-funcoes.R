test_that("def_pol funcione", {

  # Valores
  expect_true(def_pol(2,2,
                      matrix(c(0,0,10,10,0,0,3,3,0,0),ncol=2)))
  expect_false(def_pol(NA,NA,
                      matrix(c(0,0,10,10,0,0,3,3,0,0),ncol=2)))

  # Metatestes
  expect_true(mode(def_pol(2,2,
                      matrix(c(0,0,10,10,0,0,3,3,0,0),ncol=2))) == "logical")

  # Error
  expect_error(def_pol(2,2), 'argument "pol" is missing, with no default')

  # Snapshot
  expect_snapshot(def_pol("olá","mundo",
                          matrix(c(0,0,10,10,0,0,3,3,0,0),ncol=2)))

})



