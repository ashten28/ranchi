# server

server <- function(input, output, session){
  
random_suggest_vec <- eventReactive(input$suggest_random, {
  
  random_guess <- 
    restaurants %>% 
    filter(lunch == 1) %>% 
    filter(
      location %in% input$location,
      cuisine  %in% input$cuisine,
      type  %in% input$type
      # location %in% c("Midvalley"),
      # cuisine %in% c("korean", "chinese")
    ) %>% 
    sample_n(1)
  
  
  out <- 
    list(
      name = random_guess$name,
      cuisine = random_guess$cuisine, 
      rm_per_pax_min = random_guess$rm_per_pax_min,
      rm_per_pax_max = random_guess$rm_per_pax_max
      
    )
  
  return(out)
  
  
}) 
  
  
  output$random_suggest_text <- renderText({
    
    paste0(
      "<b> Name: </b>", random_suggest_vec()$name, 
      "<br>",
      "<b> Cuisine: </b>", stringr::str_to_title(random_suggest_vec()$cuisine)
      
    )
    
    
    # tagList(
    #   p(paste0(strong("Name: "), random_suggest_vec()$name)),
    #   # br(),
    #   p(paste0("Cuisine: ", stringr::str_to_title(random_suggest_vec()$cuisine)))
    #   # p("Name:")
    #   
    # )
    
  })
  
  
}