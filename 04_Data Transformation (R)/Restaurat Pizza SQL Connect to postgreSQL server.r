## HW02 Restaurat Pizza SQL ##

## Connect to postgreSQL server
## Elephantsql.com
install.packages("RPostgreSQL")
install.packages("tidyverse")
library(RPostgreSQL) 
library(tidyverse)

## Create Connection
connect <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "bekngfgh",
  user = "bekngfgh",
  password = "TzTIvNKaPZEXbTmEN-DhYIvIgPwLWexV",
  port = 5432
)

## Create Dataframe
menu <- tribble(
  ~menu_id, ~menu_name, ~price,
  1, "Hawaiian", 100,
  2, "Ham", 120,
  3, "Seafood", 110,
  4, "Cheese", 105,
  5, "Margarita", 150 
)

customers <- tribble(
  ~customer_id, ~name, ~gender, ~age, ~address,
  1, "Light", "Male", 26, "Canada",
  2, "Gift", "Female", 26,"Canada",
  3, "CK", "Female", 25, "Canada",
  4, "Nink", "Female", 26, "Korean",
  5, "Jay", "Male", 20, "Japan",
  6, "Topson", "Male", 25, "Finland",
  7, "Ceb", "Male", 31, "France",
  8, "Jeen", "Female", 24, "England",
  9, "BZM", "Male", 21, "France",
  10, "Sumail", "Male", 20, "USA"
)

orders <- tribble(
  ~order_id, ~order_date, ~customer_id, ~menu_id, ~quantity,
  1, "2023-01-01", 1, 4, 2,
  2, "2023-02-02", 2, 4, 2,
  3, "2023-03-02", 3, 5, 6,
  4, "2023-08-03", 4, 4, 5,
  5, "2023-01-03", 5, 5, 3,
  6, "2023-10-04", 6, 1, 2,
  7, "2023-09-04", 7, 2, 1,
  8, "2023-10-06", 8, 3, 4,
  9, "2023-10-29", 9, 4, 5,
  10, "2023-10-16", 10, 5, 5,
  11, "2023-05-12", 2, 4, 3,
  12, "2022-04-01", 2, 2, 4,
  13, "2022-05-01", 1, 4, 1,
  14, "2022-06-01", 1, 2, 2
)

## Write table to Database
dbWriteTable(connect, "menu", menu)
dbWriteTable(connect, "customers", customers)
dbWriteTable(connect, "orders", orders)

## Test write
dbListTables(connect)

## Get Data from Database
dbGetQuery(connect, "select menu_id, menu_name, price from menu")
dbGetQuery(connect, "select order_id, order_date, customer_id, menu_id, quantity from orders")
dbGetQuery(connect, "select customer_id, name, gender, age, address from customers")

## Close connection
dbDisconnect(connect)
