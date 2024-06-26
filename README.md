# Shiny Dashboard with ChatGPT Integration

This Shiny application integrates ChatGPT to dynamically generate ggplot2 visualizations based on uploaded CSV data. It allows users to interact with ChatGPT for generating custom plots and chat with ChatGPT for various tasks.

![](images/image2.gif)
![](images/image1.png)

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
install.packages(c("shiny", "shinydashboard", "shinydashboardPlus", "tidyverse", "plotly", "glue","bslib", "httr2"))
```


### Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/oujbih/Shiny-Dashboard-with-ChatGPT-Integration.git
```
### Setting Up Your OpenAI API Key

To set up your OpenAI API key in R, follow these steps:
1. Sign up or log in to OpenAI and generate an API key [Openai platform](https://platform.openai.com/)
2. Open your .Renviron file or create one in your home directory (~).
3. Add the following line to the .Renviron file:

```r
OPENAI_API_KEY=your-api-key-here
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


## Acknowledgements

    OpenAI for providing the ChatGPT API.
    RStudio for the Shiny framework.
    Contributors for their valuable inputs and suggestions.

## Contact

For any questions or suggestions, please open an issue on the GitHub repository or contact the project maintainer:

    Email : abderahimoujbih@gmail.com
    GitHub: Abderrahim Oujbih
