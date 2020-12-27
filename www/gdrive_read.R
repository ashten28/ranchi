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

# write.csv
write.csv(
  x = places %>% select(-`__PowerAppsId__`),
  file = "www/data/places.csv",
  row.names = F,
  na =
)