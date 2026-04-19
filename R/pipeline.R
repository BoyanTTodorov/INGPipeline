source("R/base/PackageManager.R")
source("R/base/DatabaseLayer.R")
source("R/base/PipelineManager.R")
source("R/base/DataLayer.R")

# Load all required packages
pkg <- PackageManager$new(c("DBI", "RSQLite"))
pkg$load_required()

# Database ingestion
db <- DatabaseLayer$new("data/raw/ing_sim.db")
raw_data <- db$load_data()

# Run pipeline
pipeline <- PipelineManager$new(raw_data)
final <- pipeline$run()
