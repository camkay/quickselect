# create example data
data_example <- data.frame(group  = c("A", "A", "B", "B", "A"),
                           mach   = c(NA, 2, 300, 200, 3),
                           narc   = c(2, 4, 500, 700, 10),
                           psyc   = c(3, 4, 1800, 2000, 5),
                           des    = c(100, 100, 2, 10, 1000),
                           mor    = c(10, 10, 500, 1000, 20),
                           Hap    = c(1, 2, 3, 4, 5),
                           Neur   = c(5, 4, 3, 2, 1))

# test match
test_that("match returns the correct parts of the data frame", {
  expect_equal(match(data_example, "^m"),
               structure(list(mach = c(NA, 2, 300, 200, 3), 
                              mor = c(10, 10, 500, 1000, 20)), 
                         row.names = c(NA, -5L), class = "data.frame"))
  expect_equal(match(data_example, "^n"),
               structure(list(narc   = c(2, 4, 500, 700, 10)), 
                         row.names = c(NA, -5L), class = "data.frame"))
  expect_equal(match(data_example, "^n", ignore.case = TRUE),
               structure(list(narc   = c(2, 4, 500, 700, 10),
                              Neur   = c(5, 4, 3, 2, 1)), 
                         row.names = c(NA, -5L), class = "data.frame"))

})

# test unmatch
test_that("unmatch returns the correct parts of the data frame", {
  expect_equal(unmatch(data_example, "^m"),
              structure(list(group = c("A", "A", "B", "B", "A"), 
                             narc  = c(2, 4, 500, 700, 10), 
                             psyc  = c(3, 4, 1800, 2000, 5), 
                             des   = c(100, 100, 2, 10, 1000),
                             Hap    = c(1, 2, 3, 4, 5),
                             Neur   = c(5, 4, 3, 2, 1)), 
                        row.names = c(NA, -5L), class = "data.frame"))
  expect_equal(unmatch(data_example, "^n"),
              structure(list(group = c("A", "A", "B", "B", "A"), 
                             mach = c(NA, 2, 300, 200, 3), 
                             psyc  = c(3, 4, 1800, 2000, 5), 
                             des   = c(100, 100, 2, 10, 1000),
                             mor    = c(10, 10, 500, 1000, 20),
                             Hap    = c(1, 2, 3, 4, 5),
                             Neur   = c(5, 4, 3, 2, 1)), 
                        row.names = c(NA, -5L), class = "data.frame"))
  expect_equal(unmatch(data_example, "^n", ignore.case = TRUE),
              structure(list(group = c("A", "A", "B", "B", "A"), 
                             mach = c(NA, 2, 300, 200, 3), 
                             psyc  = c(3, 4, 1800, 2000, 5), 
                             des   = c(100, 100, 2, 10, 1000),
                             mor    = c(10, 10, 500, 1000, 20),
                             Hap    = c(1, 2, 3, 4, 5)),
                        row.names = c(NA, -5L), class = "data.frame"))

})

