########################################
# 10/06/2024 Oujbih Abderrahim
# Shiny Dashboard for ChatGPT Integration
########################################

# Load necessary packages and scripts
source("src/Packages.R")
source("src/my_UI.R")
source("src/utils.R")

# Define the dashboard body
body <- dashboardBody(
  tabItems(
    tabItem("input",
            fluidRow(
              column(
                width = 3,
                box(
                  title = "Upload CSV and Settings",
                  width = 12,
                  fileInput("csv_input", "Upload a CSV file"),
                  selectInput("model1", "Model", choices = c("gpt-4o", "gpt-3.5-turbo", "gpt-4-turbo-preview")),
                  selectInput("task1", "Task", choices = c("ggplot2 v1" = "custom", "ggplot2 v2" = "custom2", "ggplot2 v3" = "custom3", "general" = "general", "code" = "code")),
                  actionButton("get_plot", label = "Generate Plots", style = "width: 90%; background-color: white;")
                )
              ),
              column(
                width = 9,
                box(
                  title = "Output",
                  width = 12,
                  tableOutput("output_table"),
                  uiOutput("plots")
                )
              )
            )
    ),
    tabItem("chatgpt",
            fluidRow(
              column(
                width = 3,
                box(
                  title = "ChatGPT Settings",
                  width = 12,
                  selectInput("model", "Model", choices = c("gpt-4o", "gpt-3.5-turbo", "gpt-4-turbo-preview")),
                  selectInput("task", "Task", choices = c("custom", "general", "code")),
                  actionButton("chat", label = "Send", class = "btn-primary m-1", width = "100%")
                )
              ),
              column(
                width = 6,
                box(
                  title = "Chat",
                  width = 12,
                  uiOutput("instructions"),
                  uiOutput("chat_history"),
                  textAreaInput("prompt", NULL, value = "Hi", width = "100%", rows = 1, placeholder = "Ask a question ...")
                )
              )
            )
    )
  )
)

# Define the UI
ui <- dashboardPage(
  skin = "black",
  header = header,
  sidebar = sidebar,
  body = body,
  controlbar = controlbar,
  title = "ChatGPT - Shiny"
)

# Define the server logic
server <- function(input, output, session) {
  
  # Reactive function to read data from uploaded CSV file
  myData <- reactive({
    req(input$csv_input)
    df <- read.csv(input$csv_input$datapath)
    df
  })
  
  # Reactive values to store chat history
  rv <- reactiveValues()
  rv$chat_history <- NULL
  
  # Observe chat button click event to send and receive messages from ChatGPT
  observeEvent(input$chat, {
    req(input$prompt != "")
    response <- chat(input$prompt,
                     model = input$model,
                     history = rv$chat_history,
                     system_prompt = input$task,
                     api_key = Sys.getenv("OPENAI_API_KEY"))
    rv$chat_history <- update_history(rv$chat_history, input$prompt, response)
    output$chat_history <- renderUI({
      req(!is.null(rv$chat_history))
      card(
        map(.x = rv$chat_history, .f = \(x) markdown(glue("**{x$role}**: {x$content}"))),
        fill = TRUE
      )
    })
    updateTextAreaInput(session, "prompt", value = "", placeholder = "Ready for more input...")
  })
  
  # Render the uploaded CSV data table
  output$output_table <- renderTable({
    head(myData())
  })
  
  # Observe plot generation button click event to generate plots from ChatGPT response
  observeEvent(input$get_plot, {
    withProgress(message = 'Generating plots, please wait...', {
      df <- myData()
      df_string <- capture.output(print(df))
      df_prompt <- paste(df_string, collapse = "\n")
      response <- chat(df_prompt,
                       model = input$model1,
                       history = rv$chat_history,
                       system_prompt = input$task1,
                       api_key = Sys.getenv("OPENAI_API_KEY"))
      rv$chat_history <- update_history(rv$chat_history, df_prompt, response)
      
      # Dynamically generate plot outputs
      output$plots <- renderUI({
        plot_output_list <- lapply(1:10, function(i) {
          plot_output_id <- paste0("plot_", i)
          plotOutput(plot_output_id)
        })
        do.call(tagList, plot_output_list)
      })
      
      # Clean up the response and parse the plot codes
      response <- gsub("```R|```|```r|library\\(ggplot2\\)|#.*", "", response)
      response <- gsub("\\n+", "\n", response)  # Clean up multiple newlines
      plot_codes <- parse(text = response)
      
      # Render the plots
      for (i in 1:10) {
        local({
          my_i <- i
          plot_code <- plot_codes[my_i]
          output[[paste0("plot_", my_i)]] <- renderPlot({
            eval(plot_code)
          })
        })
      }
    })
  })
}

# Run the Shiny application
shinyApp(ui = ui, server = server)
