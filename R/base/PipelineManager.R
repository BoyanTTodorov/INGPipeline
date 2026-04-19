library(R6)

PipelineManager <- R6Class(
  "PipelineManager", 
  public = list(
    data = NULL,
    initialize = function(data){
      self$data = data
    },
    run = function(){
      self$data
    }
  )
)
