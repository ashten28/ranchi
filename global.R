# Author: Ashten Anthony
# Email : ashten.anthony@nmg-group.com

options(shiny.launch.browser = TRUE)

# r packages to load
rpkgs <- 
  c("dplyr", "stringr", "shiny", "scales", "shinydashboard", "shinythemes", "shinyWidgets", "shinyjs", 
    "googledrive", "googlesheets4")

for (pkg in rpkgs){
  
  suppressMessages(library(pkg, character.only = T))
  
  
}

# theme pallete
theme_pallete <- 
  c("#dfe5ef", "#c3cfe1", "#9db1cf", "#6f8db9", "#4c6c9c", "#364d6e")

scales::show_col(theme_pallete)

# connect to google drive
drive_auth(email = "ashten28@gmail.com")
sheets_auth(token = drive_token())
# drive_find("restaurants")

# get drive location for sheet
drive_restaurants <- 
  drive_get("ranchi_data")

# read sheet from google drive location
places <- 
  read_sheet(drive_restaurants, sheet = "places")

restaurants <-
  places %>% 
  filter(restaurant == 1)

# get distinct list
cuisine_list <- 
  restaurants %>% 
  distinct(cuisine) %>% 
  pull(cuisine) 

type_list <- 
  restaurants %>% 
  distinct(type) %>% 
  pull(type) 

names(cuisine_list) <- 
  str_to_title(cuisine_list)

names(type_list) <- 
  str_to_title(type_list)








