library(dplyr)

edit_index <- read.csv(file.choose()) 

clean <- edit_index %>% 
  dplyr::select(Source.In, Notes) %>% 
  dplyr::mutate(Hour = as.character(as.integer(substr(Source.In, 1, 2))-1),
    MinSec = substr(Source.In, 4, 8)) %>% 
  dplyr::transmute(Mark = paste(Hour,MinSec, sep = ":"),
                   Note = Notes)

write.csv(clean, file.choose())


