## Homework ## 

## Transform: nycflight13

## Load data and library
library(nycflights13)
library(tidyverse)

## Data
data("flights")
data("airlines")

## Export CSV File
write.csv(airlines, "airlines.csv", row.names = FALSE)
write.csv(flights, "flights.csv", row.names = FALSE)

## Ask 8 Questions about this Data set ##

# Q1. What is the top 10 flight carrier?
flights %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  head(10) %>%
  left_join(airlines)


# Q2. What is the top 10 flight carrier in Dec 2013?
flights %>%
  filter(month == 12, year == 2013) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  head(10) %>%
  left_join(airlines)

# Q3. What is the top 10 departure delayed flights airline in 2013?
flights %>%
  left_join(airlines,by = "carrier") %>%
  select(name, carrier, dep_delay) %>%  
  arrange(desc(dep_delay)) %>%  
  head(10)

# Q4. What is the top 10 departure delayed flights airline in Sep 2013?
flights %>% 
  left_join(airlines,by = "carrier") %>%
  select(name, carrier, dep_delay, month) %>%
  filter(month == 9,) %>%
  arrange(desc(dep_delay)) %>%  
  head(10)

# Q5. What airline has the most long-distance flights in 2013?
flights %>%
  left_join(airlines) %>%  
  select(name, carrier, distance) %>%  
  group_by(name, carrier) %>%  
  summarise(avg_distance = mean(distance)) %>%  
  arrange(desc(avg_distance)) %>%
  head(10)

# Q6. What is the most schedule departure time is chosen by the airlines?
flights %>%
  select(sched_dep_time) %>%
  count(sched_dep_time)%>%
  arrange(desc(sched_dep_time), desc(n)) %>%
  head(10)


# Q7. How many flight has departed from JFK airport in Oct 2013?
JFK <- flights %>%  
  filter(month == 10, year == 2013, origin == "JFK") %>%  
  summarise(Total_flights = n())
print(JFK)
  
# Q8. What is the top 10 routes of Delta Air Lines Inc.?
DL <- flights %>%
  filter(carrier == "DL") %>%
  count(origin,dest) %>%
  arrange(desc(n)) %>%
  head(10)
print(DL)


  
  
