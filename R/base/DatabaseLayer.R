DatabaseLayer <- R6Class(
  "DatabaseLayer",
  
  public = list(
    
    db_path = NULL,
    
    initialize = function(path) {
      self$db_path <- path
    },
    
    load_data = function() {
      
      # Connect (creates DB file if missing)
      con <- DBI::dbConnect(RSQLite::SQLite(), self$db_path)
      
      # Create table if missing
      if (!"customers" %in% DBI::dbListTables(con)) {
        
        df <- data.frame(
          customer_id = 1:5,
          income = c("30,000", "45,000", "50,000", "28,500", "60,000"),
          age = c(25, 34, 41, 29, 52),
          default_flag = c("no", "no", "yes", "no", "yes")
        )
        
        DBI::dbWriteTable(con, "customers", df)
      }
      
      # Read data
      data <- DBI::dbReadTable(con, "customers")
      
      # Close connection
      DBI::dbDisconnect(con)
      
      return(data)
    }
  )
)
