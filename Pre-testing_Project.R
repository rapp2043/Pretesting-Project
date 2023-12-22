library(air)
library(ggplot2, tidyverse)
library(shiny)

summary(data)


# Load the necessary library
library(ggplot2)

# Read the data
data <- read.csv("path/to/your/CompTIA_Aplus_Pretest_Scores.csv")

# Create a density plot
ggplot(data, aes(x = `Test Score`)) +
  geom_density(fill = "lightblue") +
  theme_minimal() +
  labs(title = "Density Plot of Test Scores",
       x = "Test Score",
       y = "Density")

# Create a histogram of test scores
ggplot(data, aes(x = `Test Score`)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  theme_minimal() +
  labs(title = "Distribution of Test Scores",
       x = "Test Score",
       y = "Count")

# Boxplot of test scores by program
ggplot(data, aes(x = Program, y = `Test Score`)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  theme_minimal() +
  labs(title = "Test Scores by Program",
       x = "Program",
       y = "Test Score")


# Aggregate data to find mean scores by program
mean_scores <- aggregate(`Test Score` ~ Program, data, mean)

# Bar chart of mean test scores by program
ggplot(mean_scores, aes(x = Program, y = `Test Score`)) +
  geom_bar(stat = "identity", fill = "coral", color = "black") +
  theme_minimal() +
  labs(title = "Average Test Scores by Program",
       x = "Program",
       y = "Average Score")

# Example scatter plot code
# Replace `OtherNumericVariable` with your actual variable name
ggplot(data, aes(x = Program, y = `Test Score`)) +
  geom_point(color = "green") +
  theme_minimal() +
  labs(title = "Scatter Plot of Test Scores vs Another Variable",
       x = "Other Variable",
       y = "Test Score")

# Count the number of agents in each program
program_count <- table(data$Program)

# Calculate percentages
percentages <- round(100 * program_count / sum(program_count), 1)

# Create labels with percentages
labels <- paste(names(program_count), "\n", percentages, "%", sep = "")

# Pie chart with percentage labels
pie(program_count, labels = labels, col = rainbow(length(program_count)),
    main = "Proportion of Agents in Each Program")

--------------------------------------------
#Shiny Plot Scoring by agent and program
  
# Define the User Interface
ui <- fluidPage(
  titlePanel("Test Scores by Program"),
  
  # Dropdown menu to select a program
  selectInput("program", "Choose a Program:", choices = unique(data$Program)),
  
  # Output: Plot
  plotOutput("scorePlot")
)

# Define the server logic
server <- function(input, output) {
  output$scorePlot <- renderPlot({
    # Filter data based on selected program
    filtered_data <- subset(data, Program == input$program)
    
    # Plot
    ggplot(filtered_data, aes(x = `Agent ID`, y = `Test Score`)) +
      geom_bar(stat = "identity", fill = "steelblue") +
      geom_hline(yintercept = 70, color = "red", linetype = "dashed", size = 1) +
      theme_minimal() +
      labs(title = paste("Test Scores in", input$program),
           x = "Agent ID",
           y = "Test Score")
  })
}

# Run the application
shinyApp(ui = ui, server = server)


--------------------------------------------
#Boxplots for the Programs in the Shiny App
  
  # Define the User Interface
  ui <- fluidPage(
    titlePanel("Boxplots of Test Scores by Program"),
    
    # Dropdown menu to select a program or all programs
    selectInput("program", "Choose a Program:", 
                choices = c("All Programs", unique(data$Program))),
    
    # Output: Plot
    plotOutput("boxPlot")
  )

# Define the server logic
server <- function(input, output) {
  output$boxPlot <- renderPlot({
    # Check if 'All Programs' is selected
    if (input$program == "All Programs") {
      plot_data <- data
    } else {
      plot_data <- subset(data, Program == input$program)
    }
    
    # Boxplot
    ggplot(plot_data, aes(x = Program, y = `Test Score`)) +
      geom_boxplot(fill = "lightblue", color = "black") +
      theme_minimal() +
      labs(title = paste("Boxplot of Test Scores in", input$program),
           x = "Program",
           y = "Test Score")
  })
}

# Run the application
shinyApp(ui = ui, server = server)