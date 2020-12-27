# Author: Ashten Anthony
# Email : ashten.anthony@nmg-group.com

options(shiny.launch.browser = TRUE)

# r packages to load
library(dplyr)
library(stringr)
library(shiny)
library(scales)
library(shinydashboard)
library(shinythemes)
library(shinyWidgets)
library(shinyjs)
library(googledrive)
library(googlesheets4)

# theme pallete
theme_pallete <- 
  c("#dfe5ef", "#c3cfe1", "#9db1cf", "#6f8db9", "#4c6c9c", "#364d6e")

scales::show_col(theme_pallete)


# read data
places <- read.csv("www/data/places.csv")

# filter for restaurants 
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










