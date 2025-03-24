# --------------------------------------------------------------------
# SECTION 1   : COURSE AND ASSIGNMENT DETAILS
# --------------------------------------------------------------------
# Course      : LIS-4317 Visual Analytics
# Assignment  : Module 9 Assignment - Multivariate Visualization
# URL         : [Not provided; please insert course URL if available]
# Filename    : LIS4317-Mod09.R
# Purpose     : This script creates a simple multivariate scatterplot using ggplot2 and the mtcars dataset to explore relationships between car weight, fuel efficiency, and cylinder count for a visual analytics assignment.
# Author      : Steven Barden
# Email       : StevenBarden@usf.edu
# Created     : 2025-03-24-1555.11 (EST)
# Updated     : 2025-03-24-1823.23 (EST)
# License     : The Unlicense
# Description : This script serves as a structured R template for data analysis,
#               visualization, and reporting, designed for flexibility and reusability.
#
#
# --------------------------------------------------------------------
# SECTION 2: ENVIRONMENT SETUP
# --------------------------------------------------------------------

# Set Working Directory (Modify as Needed)
tryCatch({
  setwd("./")  # Replace with your directory, e.g., "C:/Users/Steve/RProjects"
}, error = function(e) {
  stop("Error setting the working directory: ", e$message)
})

# Display Working Directory
tryCatch({
  print(getwd())
}, error = function(e) {
  stop("Error retrieving the working directory: ", e$message)
})

# Ensure Output Width for Terminal Display (Optional, Unix-based Systems)
tryCatch({
  options(width = 80) # Adjust width as needed
}, error = function(e) {
  print("Could not set terminal width.")
})

# Load Required Libraries
tryCatch({
  library(ggplot2)
}, error = function(e) {
  stop("Error loading libraries: ", e$message)
})

# --------------------------------------------------------------------
# SECTION 3: DEPENDENCIES & INSTALLATION
# --------------------------------------------------------------------

# Required Libraries
required_packages <- c("ggplot2")

# Function to Check and Load Required Libraries
check_and_load_library <- function(package) {
  if (!require(package, character.only = TRUE)) {
    tryCatch({
      cat("Installing package:", package, "\n")
      install.packages(package)
      library(package, character.only = TRUE)
      cat("Successfully loaded:", package, "\n")
    }, error = function(e) {
      stop(paste("Failed to install/load package:", package, "-", e$message))
    })
  } else {
    cat("Package already loaded:", package, "\n")
  }
}

# Load All Required Packages
tryCatch({
  lapply(required_packages, check_and_load_library)
}, error = function(e) {
  stop("Package loading failed: ", e$message)
})

# --------------------------------------------------------------------
# SECTION 4: UTILITY FUNCTIONS
# --------------------------------------------------------------------

# Function to Check for Missing Values
check_missing_values <- function(data) {
  missing_count <- sum(is.na(data))
  if (missing_count > 0) {
    cat("Warning:", missing_count, "missing values detected.\n")
  } else {
    cat("No missing values found.\n")
  }
  return(missing_count)
}

# --------------------------------------------------------------------
# SECTION 5: DATA LOADING
# --------------------------------------------------------------------

# Load mtcars dataset (built-in R dataset)
load_sample_data <- function() {
  tryCatch({
    data <- mtcars
    cat("Loaded mtcars dataset.\n")
    return(data)
  }, error = function(e) {
    stop("Error loading mtcars: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 6: DATA PROCESSING
# --------------------------------------------------------------------

process_data <- function(data) {
  tryCatch({
    cat("Processing data...\n")
    
    # Step 1: Check for missing values (mtcars has none, but included for template)
    check_missing_values(data)
    
    # Step 2: No additional transformations needed for this simple example
    processed_data <- data
    
    cat("Data processing completed successfully.\n")
    return(processed_data)
  }, error = function(e) {
    stop("Error processing data: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 7: ANALYSIS FUNCTIONS
# --------------------------------------------------------------------

analyze_data <- function(data) {
  tryCatch({
    cat("Analyzing data...\n")
    
    # No complex analysis needed for this assignment; pass data through
    analysis_results <- data
    
    cat("Analysis completed successfully.\n")
    return(analysis_results)
  }, error = function(e) {
    stop("Error during analysis: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 8: VISUALIZATION FUNCTIONS
# --------------------------------------------------------------------

visualize_data <- function(data, plot_type = "scatter") {
  tryCatch({
    cat("Creating visualizations...\n")
    
    if (plot_type == "scatter") {
      # Multivariate scatterplot with mtcars
      plot <- ggplot2::ggplot(data, aes(x = wt, y = mpg, color = factor(cyl))) +
        geom_point(size = 3) +
        theme_minimal() +
        labs(
          title = "Fuel Efficiency vs. Car Weight by Cylinder Count",
          x = "Weight (1000 lbs)",
          y = "Miles Per Gallon (MPG)",
          color = "Cylinders"
        )
    } else {
      stop("Unsupported plot type for this assignment.")
    }
    
    # Display the plot
    print(plot)
    
    # Save the plot (optional, uncomment if needed)
    # ggsave("LIS4317-Mod09-Scatterplot.png", plot, width = 8, height = 6)
    
    cat("Visualization completed successfully.\n")
    return(invisible(plot))
  }, error = function(e) {
    stop("Error creating visualization: ", e$message)
  })
}

# --------------------------------------------------------------------
# SECTION 9: MAIN EXECUTION BLOCK
# --------------------------------------------------------------------

main <- function() {
  tryCatch({
    cat("Starting script execution...\n")
    
    # Step 1: Load Data
    cat("Step 1: Loading data...\n")
    data <- load_sample_data()
    
    # Step 2: Process Data
    cat("Step 2: Processing data...\n")
    processed_data <- process_data(data)
    
    # Step 3: Analyze Data
    cat("Step 3: Analyzing data...\n")
    analysis_results <- analyze_data(processed_data)
    
    # Step 4: Visualize Results
    cat("Step 4: Visualizing results...\n")
    visualize_data(analysis_results, "scatter")
    
    cat("Script execution completed successfully.\n")
    return(invisible(NULL))
  }, error = function(e) {
    stop("Script execution failed: ", e$message)
  })
}

# Execute the main function
main()

# --------------------------------------------------------------------
# SECTION 10: VERSION HISTORY
# --------------------------------------------------------------------
# Version History:
# - Version 1.0 (2025-03-24): Initial script for Module 9 assignment.

# --------------------------------------------------------------------
# SECTION 11: ADDITIONAL NOTES
# --------------------------------------------------------------------

# Best Practices:
# - Ensure secure handling of API keys and credentials (N/A here).
# - Keep code modular and organized for maintainability.
# - Validate data inputs to prevent unexpected errors.
# - Use consistent naming conventions for variables and functions.
# - Include appropriate documentation and comments.
# - Test functions with small datasets before full execution (mtcars is small and built-in).
#
# Notes:
# - Replace [YOUR_WORKING_DIRECTORY] with your actual path before running.
# - Course URL was not provided; add it to Section 1 if available.
# - This script meets the <2-hour requirement for coding and visualization.

# --------------------------------------------------------------------
# END OF TEMPLATE
# --------------------------------------------------------------------