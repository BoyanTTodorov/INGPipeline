
PackageManager <- R6Class(
  "PackageManager",
  public = list (
    required_packages = NULL,
    initialize = function(packages) {
      self$required_packages <- c("R6", packages)
    },
    load_required = function(){
      for (pack in self$required_packages) {
        if(!requireNamespace(pack, quietly = TRUE)){
          renv::install(pack)
        }
        library(pack, character.only = TRUE)
      }
    }
  )
)