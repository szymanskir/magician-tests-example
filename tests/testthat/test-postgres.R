test_that("magician postgres sample", {
  magician::with_postgres_connection("postgres", {
    dplyr::copy_to(
      con,
      iris,
      "iris"
    )
    
    iris_tbl <- dplyr::tbl(con, "iris")
    
    row_count <- dplyr::count(iris_tbl) %>% dplyr::collect() %>% dplyr::pull(n)
    
    expect_equal(row_count, 150)
  })
})


test_that("magician postgres sample", {
  magician::with_postgres_connection("postgres", code = {
    dplyr::copy_to(
      con,
      mtcars,
      "mtcars"
    )
    
    mtcars_tbl <- dplyr::tbl(con, "mtcars")
    
    carb_sum <- dplyr::summarise(mtcars_tbl, carb = sum(carb, na.rm = TRUE)) %>%
      dplyr::pull(carb)
    
    expect_equal(carb_sum, 90)
  })
})
