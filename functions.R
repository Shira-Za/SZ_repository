create_df <- function(df) {
  
  results_list <- list()
  for (var_names in colnames(df)) {
    var <- df[[var_names]]
      if (class(var) == "numeric" | class(var) == "integer") {
         statistics = data.frame(
          Variable = var_names,
          Type = "Numeric",
          Minimum = min(var_names, na.rm = TRUE),
          Maximum = max(var_names, na.rm = TRUE),
          Average = mean(var_names, na.rm = TRUE),
          STD = sd(var_names, na.rm = TRUE),
          Levels = NA
        )
      }
    else if (class(var) == "factor") {
      num_level = df |>
        count(gender)
          statistics = data.frame(
            Variable = var_names,
            Type = "Categorical",
            Minimum = NA,
            Maximum = NA,
            Average = NA,
            STD = NA,
            Levels = num_level
          )
      }
    results_list[[var_names]] = statistics
    
  }
  
  results <- do.call(rbind, results_list)
  print(results)
}
