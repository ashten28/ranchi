# ui

fluidPage(useShinyjs(), 
          theme = shinytheme("yeti"),
          
          fluidRow(
            column(8, 
                   headerPanel(
                     title = "Hi, I am Ranchi, your lunch bot", 
                     windowTitle = "Ranchi"),
                   style = "text-align:left; display:inline; margin-left:0"
                   )
          ),
          
          fluidRow(
            column(12, align = 'right',
                   a("Add more restaurants here", href = "https://docs.google.com/spreadsheets/d/1NgSBO6L0MkMbioPnE2F4sJaXUVd-aN2HMKWEfRc5OSU/edit?usp=sharing"),
                   
                   )
          ),
          
          fluidRow(
            column(12, 
                   wellPanel(
                     fluidRow(
                       column(11, 
                              h3("Random suggest", style = "text-decoration:underline")
                              )
                       
                     ),
                     br(),
                     fluidRow(
                       column(3, 
                              pickerInput(
                                # width = "100%",
                                inputId = "location",
                                label = "Location:",
                                choices = c("Midvalley", "More coming soon"),
                                selected = "Midvalley",
                                multiple = F,
                                choicesOpt = list(
                                  disabled = c("Midvalley", "More coming soon") %in% c("More coming soon")
                                )
                              )
                       ),
                       
                       column(3, 
                              pickerInput(
                                # width = "100%",
                                inputId = "cuisine",
                                label = "Cuisine:",
                                choices = cuisine_list,
                                selected = cuisine_list,
                                multiple = TRUE,
                                options = list(`actions-box` = TRUE)
                                
                              )
                       ),
                       
                       column(3, 
                              pickerInput(
                                # width = "100%",
                                inputId = "type",
                                label = "Type:",
                                choices = type_list,
                                selected = type_list,
                                multiple = TRUE,
                                options = list(`actions-box` = TRUE)
                                
                              )
                       ),
                       
                       column(3, style = "margin-top:23px", 
                              actionButton(
                                inputId = "suggest_random", label = "Suggest!", icon = icon("sign-in-alt"), 
                                style = "color: #fff; background-color: #364d6e; border-color:#364d6e") 
                              
                              
                              
                       )
                       
                     ),
                     br(),
                     # p(paste0("Restaurant: ", "Ko Hyang"))
                     htmlOutput("random_suggest_text")
                     
                     
                     
                     )
            )
            
            ),
          
          fluidRow(
            column(12, 
                   wellPanel(
                     h3("Smart suggest", style = "text-decoration:underline"),
                     br(),
                     h5("Coming soon")
                     )
            )
          )
            
            
)