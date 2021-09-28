test_that("numero de colunas e linhas", {
  expect_equal(ncol(oco2_br), 11)
  expect_equal(nrow(oco2_br), 146646)

  expect_true(is.character(oco2_br$longitude_bnds))
  expect_true(is.character(oco2_br$latitude_bnds))
  expect_true(is.character(oco2_br$time_bnds_yyyymmddhhmmss))
  expect_true(is.character(oco2_br$alt_bnds_km))

  expect_true(is.numeric(oco2_br$longitude))
  expect_true(is.numeric(oco2_br$latitude))
  expect_true(is.numeric(oco2_br$time_yyyymmddhhmmss))
  expect_true(is.numeric(oco2_br$altitude_km))
  expect_true(is.numeric(oco2_br$fluorescence_offset_relative_771nm_idp))
  expect_true(is.numeric(oco2_br$fluorescence_offset_relative_757nm_idp))
  expect_true(is.numeric(oco2_br$xco2_moles_mole_1))
})
