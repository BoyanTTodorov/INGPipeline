test_that("Testing PipelineManagerClass with NULL argument",
          {
            # setup
            df <- data.frame(
              id = c(1:5),
              name = c("A", "B", "C", "D", "E"),
              value = rnorm(5)
            )
           
            pipeline <- PipelineManager$new(df)
            # action
            result <- pipeline$run()
            # expectation
            # expect_null(result)
            expect_equal(df, result)
            expect_type(result, "list")
            expect_s3_class(result, "data.frame")
          }
)
