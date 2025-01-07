create_df <- function(df, subject_start, subject_end) {
if (nrow(df) < 10) {
  stop("Error: Data is too short!")
}

#checking the new arguments:
if (!is.na(subject_start) & !is.na(subject_end)) { #both values are numbers
  if (subject_start > nrow(df) | subject_start > subject_end | subject_end < 1) {
    stop("Error: Invalid start or end values!")
  }
  df <- df[subject_start:subject_end, ]
  } 
  else if (!is.na(subject_start)) { #only start value is given
    if (subject_start > nrow(df)) { #checking value's relevance
      stop("Error: subject_start value is out of boundry!")
    }
    df <- df[subject_start:nrow(df), ]
    } else if (!is.na(subject_end)) { #only end value is given
      if (subject_end < 1) {
        stop("Error: subject_end value is out of boundry!")
      }
      df <- df[1:subject_end, ]
    }

#Initializing results list:
results_list <- list()

#looping through data columns:
for (var_names in colnames(df)) {
      var <- df[[var_names]]
      if (class(var) == "numeric" | class(var) == "integer") {
        statistics = data.frame(
          Variable = var_names,
          Type = "Numeric",
          Minimum = min(var, na.rm = TRUE),
          Maximum = max(var, na.rm = TRUE),
          Average = mean(var, na.rm = TRUE),
          STD = sd(var, na.rm = TRUE),
          Levels = NA
        )
      }
      else if (class(var) == "factor") {
        levels_counts = as.data.frame(table(var))  # Count levels
        levels_summary = paste0(levels_counts$var, " (n=", levels_counts$Freq, ")", collapse = "; ")
        statistics = data.frame(
          Variable = var_names,
          Type = "Categorical",
          Minimum = NA,
          Maximum = NA,
          Average = NA,
          STD = NA,
          Levels = levels_summary
        )
      }
      results_list[[var_names]] = statistics
      
    }
    results <- do.call(rbind, results_list)
    print(results)
  }
