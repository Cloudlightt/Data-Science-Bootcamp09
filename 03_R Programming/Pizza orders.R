# 1: Annouce Variables
chatbot_pizza <- function() {
    menu = data.frame(
    id_menu = c(1:5),
    menu_name = c("Hawaiian","Double Cheese","Meat Deluxe","Ham & Crab Stick", "Seafood"),
    price = c(299, 199, 399, 289, 429)
    )

price <- 0

# 2: Welcome message & order pizza
    print(" Welcome to the Pizza Restaurant 🍕🍕 ")
    print(" This is our Manu ♨️♨️ ")
    print(menu)
    print(" ⏭️⏭️⏭️⏭️⏭️⏭️⏭️⏭️⏭️⏭️⏭️⏭️ ")
    order_cus <- readline("Please choose your order 😄: ")


# 3: Menu selection: Conditional
    if (order_cus == "1") {
        price <- price + 299
        pizza_name <- paste("Hawaiian")

    } else if (order_cus == "2") {
        price <- price + 199
        pizza_name <- paste("Double Cheese")

    }else if (order_cus == "3") {
        price <- price + 399
        pizza_name <- paste("Meat Deluxe")

    }else if (order_cus == "4") {
        price <- price + 289
        pizza_name <- paste("Ham & Crab Stick")

    }else if (order_cus == "5") {
        price <- price + 429
        pizza_name <- paste("Seafood")

    }else {
        print(" Invalid input. Please choose 1:5 ")
        chatbot_pizza() # Restart the function if invalid input
    }

  print(pizza_name)
  print(price)
  print(" Check Bill ✅ ")
  print(" Thank so much 😊 ")
}
