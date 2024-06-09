# Shiny Dashboard with ChatGPT Integration

This Shiny application integrates ChatGPT to dynamically generate ggplot2 visualizations based on uploaded CSV data. It allows users to interact with ChatGPT for generating custom plots and chat with ChatGPT for various tasks.

## Features

- **CSV Upload and Visualization**: Upload CSV files and visualize data in table format.
- **Dynamic Plot Generation**: Generate multiple ggplot2 plots using ChatGPT.
- **Interactive Chat Interface**: Chat with ChatGPT for generating plots and answering questions.

## Installation

### Prerequisites

- R (version 4.0 or higher)
- RStudio (recommended)

### Required R Packages

The following R packages are required:
  
```r
install.packages(c("shiny", "shinydashboard", "shinydashboardPlus", "tidyverse", "plotly", "glue", "httr2"))
```


### Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/oujbih/Shiny-Dashboard-with-ChatGPT-Integration.git
```
Running the Application

Open the project in RStudio and run the application with the following command:

```r

shiny::runApp()
```
## Usage

    Upload CSV File: Click on the "Input (Upload)" tab and upload your CSV file.
    Generate Plots: Select the model and task, then click "Generate Plots" to see the visualizations.
    Chat with ChatGPT: Go to the "2.ChatGPT" tab, enter your prompt, and click "Send" to interact with ChatGPT.

## Project Structure

    src/Packages.R: Contains the required library imports.
    src/my_UI.R: Defines the UI components such as header, sidebar, and controlbar.
    src/utils.R: Utility functions for handling ChatGPT responses and other helper functions.
    app.R: The main application script that defines the server logic and runs the Shiny app.

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
Acknowledgements

    OpenAI for providing the ChatGPT API.
    RStudio for the Shiny framework.
    Contributors for their valuable inputs and suggestions.

## Contact

For any questions or suggestions, please open an issue on the GitHub repository or contact the project maintainer:

    Your Name: abderahimoujbih@gmail.com
    GitHub: Abderrahim Oujbih
