## 1 This game

import random

def game():
    print("🤖🎮 Welcome to the Game: Rock Paper Scissors 🎮🤖")
    print(" ## You can choose: rock 🔨, scissors ✂️, paper 📃, e = End game 🔚 ##")
    print(" ### The wiiner is who can get the 3 points first 🥇🥇 ###")
    player_name = input("What is your name?: ")
    print(f"Hi {player_name}. Let's play game")

## 2 Announce Variables
    ## Score ##
    hands = ["rock", "scissors", "paper"]
    user_scores = 0
    bot_scores = 0
    # Round
    count = 0

    while True: # Loop to continue the game
        game_playing = input("Are you ready?:").lower()

        if game_playing == "yes":
            count += 1
            print(f"Round no.{count}")
            user_hand = input("Please choose one of these ( rock 🔨, scissors ✂️, paper 📃,  e = End game 🔚:")
            computer_hand = random.choice(hands)


    ## Condition ##

        # Draw #
            if user_hand == computer_hand:
                print("➡️ Draw 😒")
                print(f"{player_name}'s hand : {user_hand}")
                print(f"computer's hand: {computer_hand}")
                bot_scores += 0

        # Lose #
            elif user_hand == "paper" and computer_hand == "scissors"\
            or user_hand == "scissors" and computer_hand == "rock"\
            or user_hand == "rock" and computer_hand == "paper":
                print("Bot scores +1 ❌")
                bot_scores += 1

        # Win #
            elif user_hand  == "paper" and computer_hand == "rock"\
            or user_hand == "scissors" and computer_hand == "paper"\
            or user_hand == "rock" and computer_hand == "scissors":
                print("User scores +1 ✅")
                user_scores += 1

        # Result socre #
        elif game_playing == "e":
            print("🌧️🌧️ Summary 🌧️🌧️")
            print(f"{player_name} score is {user_scores}")
            print(f"computer score is {bot_scores}")

            if (user_scores > bot_scores):
                print("You are the Winner 🏆🏆🥇🥇")

            elif (user_scores < bot_scores):
                print("You are lose ❌❌🤷‍♀️🤷‍♀️")

            else:
                print("Draw 😒😒😒😒")

            print("Thanks for playing, see ya")
            break
