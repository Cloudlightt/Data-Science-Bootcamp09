## 1 This game
game <- function() {
    print("🤖🤖 Welcome to the Game 🎮Rock Paper Scissors 🤖🤖")
    print(" ## You can choose: [ 1 ] = Rock 🔨, [ 2 ] = Scissors ✂️, [ 3 ] = Paper, [ e ] = End game 🔚 ##")
    print(" ### The wiiner is who can get the 5 points first 🥇🥇 ###")
    player <- readline("What's your name:")
    print("Let' Do it!")

## 2 Announce Variables
    ## Score ##
    user_scores = 0
    bot_scores = 0
    # Round
    count <- 0

## 3
    while(T) {
        flush.console()
        hands <- c("1", "2", "3")
        bot_hand <- sample(hands,1)
        user_hand <- readline("Your turn 1, 2, 3, 'e'(End game): ")

        ## Condition

        # Draw #
        if (bot_hand == user_hand) {
            count <- count + 1
            print(paste("📍Round ", count))
            print(paste("Bot :", bot_hand," | You :", user_hand, " ➡️ Draw 😒"))

        # Lose #
        } else if (( bot_hand == "1" & user_hand == "2" ) |
                   ( bot_hand == "2" & user_hand == "3" ) |
                   ( bot_hand == "3" & user_hand == "1" ) ) {
            count <- count + 1
            print(paste("📍Round", count))
            print(paste("Bot :", bot_hand, "| You :", user_hand, " ➡️ Lose ❌"))
            bot_scores = bot_scores + 1
            print("Bot scores +1")

        # Win #
        } else if (( bot_hand == "1" & user_hand == "3" ) |
                   ( bot_hand == "2" & user_hand == "1" ) |
                   ( bot_hand == "3" & user_hand == "2" ) ) {
            count <- count + 1
            print(paste("📍Round", count))
            print(paste("Bot :", bot_hand, "| You :", user_hand, " ➡️ Win ✔️"))
            user_scores = user_scores + 1
            print("User scores +1")

        # Summary Scores #
        } else if ( user_hand == "e" ) {
            print("🌧️🌧️🌧️🌧️ Summary 🌧️🌧️🌧️🌧️")
            print(paste("Bot :", bot_scores, "| You :", user_scores))

            if (user_scores > bot_scores) {
                print("You are the Winner 🏆🏆🥇🥇")

            } else if (user_scores < bot_scores) {
                print("You are lose ❌❌🤷‍♀️🤷‍♀️")
            } else {
                print("Draw 😒😒😒😒")
            }
            break

    }
  }
}
