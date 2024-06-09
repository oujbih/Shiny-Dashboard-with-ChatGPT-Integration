# Define the dashboard header
header <- dashboardHeader(title = "Shiny")

# Define the dashboard sidebar with menu items
sidebar <- dashboardSidebar(
  id = "mysidebar",
  sidebarMenu(
    menuItem(text = "Input (Upload)", tabName = "input", icon = icon("table")),
    menuItem(text = "2.ChatGPT", tabName = "chatgpt", icon = icon("plus"), selected = FALSE)
  )
)

# Define the dashboard controlbar
controlbar <- dashboardControlbar(
  skin = "dark",
  controlbarMenu(
    skinSelector()
  )
)
