PipelineManager <- R6Class(
  "PipelineManager",
  
  public = list(
    
    raw_data = NULL,
    
    initialize = function(data) {
      self$raw_data <- data
    },
    
    run = function() {
      # For now, just return the raw data
      return(self$raw_data)
    }
  )
)
