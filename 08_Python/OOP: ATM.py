## OOP ATM

from random import randint

class ATM:
    def __init__(self, account_name, bank_name, intial):
        self.account_name = account_name
        self.bank_name = bank_name
        self.balance = intial

## String representation
    def __str__(self):
        return f"This's an account of {self.account_name}, bank: {self.bank_name}"

## Method -> function
    def check_balance(self):
        print(f"Balance: {self.balance} THB")


    def deposit(self, money):
        self.balance += money
        print(f"Deposit successfully: your new balance:: {self.balance} THB")

    def get_OTP(self):
        otp = randint(1000, 9999)
        print(f"Your OTP: {otp} This OTP will be availble in the next 2 minutes.")


    def withdraw(self, money):
        self.balance -= money
        print(f"Withdraw successfully: your new balance:: {self.balance} THB")


    def receipt(self):
        while(True):
            user_print = input("Do you want receipt? - (Y/N) ")
            if user_print == "Y":
                print("Get receipt 🫡")
            if user_print == "N":
                print("Thank you 🙏")
            break


    def message(self):
        while(True):
            user_print = input("Do you want to receive news? (Y/N)")
            if user_print == "Y":
                print("Thank you for recevie new 🫡")
            if user_print == "N":
                print("Thank you 🙏")
            break


    def buy_fund(self):
        while(True):
            print(fund_list)
            your_fund = input("Choose your fund or press 'e' to Exit:")

            if your_fund == 'Apple':
                print("You buy Apple funding, Thank you for use our service")

            elif your_fund == 'Google':
                print("You buy Google funding, Thank you for use our service")

            elif your_fund == 'Intel':
                print("You buy Intel funding, Thank you for use our service")

            elif your_fund == "e":
                print("Thank you 🙏")
                break

    def update_name(self, new_name):
        self.new_name = new_name
        print(f"Your old account name is {self.account_name} ")

        while(True):
            user_print = input("Do you want to rename the account? (Y/N)")

            if user_print == "Y":
                print(f"The account name was successfully changed to: {new_name} ")
                print("Thank you so much 🙏")
                break

            if user_print == "N":
                print("Proceed with cancel change the account name.")
                print("Thank you so much 🙏")
                break
