#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(shinyWidgets)

# Define UI for application that draws a histogram

shinyApp(ui  = navbarPage(theme=shinytheme("united"),
                          title = 'Income Classifier',
                          
                          tabPanel("Classify",icon=icon("network-wired"),
                                   sidebarPanel(width=2,
                                                tags$style(".well {background-color:#e95420;color: white;"),
                                                h4("Interesting Facts "),
                                                br(),
                                                h5("Adult dataset is a simplified version of ",
                                                   "1994 US Census dataset that has 41 features ",
                                                   "and 300K records."),
                                                br(),
                                                h5("U.S has the highest level of",
                                                   "Income inequality among G7 countries."),
                                                
                                                
                                   ),
                                   mainPanel(
                                     
                                     
                                     h2("Predict Income categories"),
                                     tableOutput("table"),
                                     h4("Predict your income into categories above 50K and below 50K(USD) based on age, qualification, job type, race, native country etc. Model is a built based on  1994 Adult dataset."),
                                     br(),
                                     h3("Sociocultural Information"),
                                     helpText("Note: Select region based on your",
                                              "native country."),
                                     fluidRow(
                                       column(width = 4,
                                              selectInput("userregion",
                                                          label="Region:",
                                                          choices = country_region,
                                                          selected = "----")),
                                       column(width = 4,
                                              selectInput("userrace",
                                                          label="Race:",
                                                          choices = socio_race,
                                                          selected = "----"))
                                     ),
                                     
                                     h3("Personal Information"),
                                     fluidRow(
                                       column(width = 4,
                                              numericInput("userage",
                                                           label="Age:",
                                                           value=25,
                                                           min=1,
                                                           max=75))
                                     ),
                                     fluidRow(
                                       column(width = 4,
                                              selectInput("usersex",
                                                          label="Gender:",
                                                          choices = sex_gender,
                                                          selected = "----")),
                                       
                                       column(width = 4,
                                              selectInput("userrelation",
                                                          label="Relationship:",
                                                          choices = family_relationship,
                                                          selected = "----")),
                                       
                                       column(width = 4,
                                              selectInput("userstatus",
                                                          label="Marital Status:",
                                                          choices = marital_status,
                                                          selected = "----"))
                                     ),
                                     h3("Professional Information"),
                                     fluidRow(
                                       column(width = 4,
                                              selectInput("usereducation",
                                                          label="Education:",
                                                          choices = prof_education,
                                                          selected = "----")),
                                       column(width = 4,
                                              selectInput("useremployment",
                                                          label="Occupation:",
                                                          choices = prof_occupation,
                                                          selected = "----")),
                                       column(width = 4,
                                              selectInput("useremploymenttype",
                                                          label="Type:",
                                                          choices = prof_workclass,
                                                          selected = "----")),
                                       
                                     ),
                                     br(),
                                     helpText("Note:Capital gain less than 3400 is low ,",
                                              "between 3400 and 14084 is medium ",
                                              "greater than 14084 is high.",
                                              "Capital loss less than 1670 is low",
                                              "between 1670 and 1977 is medium",
                                              "greater then 1977 is high."),
                                     fluidRow(
                                       column(width=4,
                                              sliderTextInput(
                                                inputId="usercapgain",
                                                label="Capital Gain:",
                                                grid=1,
                                                choices=c("Zero","Low","Medium","High"),
                                                selected ="Low")),
                                       column(width=4,
                                              sliderTextInput(
                                                inputId="usercaploss",
                                                label="Capital Loss:",
                                                grid=1,
                                                choices=c("Zero","Low","Medium","High"),
                                                selected ="Low")),
                                       column(width = 4,
                                              selectInput("userweeklyhours",
                                                          label="Hours of Work:",
                                                          choices = prof_hours,
                                                          selected = "----")),
                                     ),
                                     
                                     br(),
                                     br(),
                                     actionButton("calc", "Predict",class = "btn-primary"),
                                     br(),
                                     br(),
                                     #verbatimTextOutput("text1")
                                     bsModal(id="pop",title="Income Classifier Prediction",trigger="calc",size="medium",
                                             verbatimTextOutput("text1"))
                                     
                                     # 
                                     # h2("Header 2"),
                                     # h3("Header 3"),
                                     # h4("Header 4"),
                                     # h5("Header 5")
                                     # 
                                   )) ,
                          tabPanel("About",
                                   mainPanel(
                                     h2("Abstract"),
                                     h4("Income Classifier is an application developed to classify target population based on Income for a marketing campaign.The demographic information of the population is obtained from Adult dataset.",
                                        "The application is build using R and shinyapp."),
                                     h2("Ethics & Privacy"),
                                     h3("Data"),
                                     h4("There is no attribute that is more sensitive than others, any attribute sensitivity that might occur is contexual. Membership disclore may be a concern since the data is from census.Personally Identifiable Information is not available in the dataset."),
                                     h3("Application"),
                                     h4("The hosting environment has implemented best practises for security. The data and application logic is not exposed in the application. Currently there is no authenication set for the application.")
                                     
                                   )
                                   
                          ) # fluidRow 
                          
                          
                          
))