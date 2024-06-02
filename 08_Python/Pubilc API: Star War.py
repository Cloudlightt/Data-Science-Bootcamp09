# Import module
import csv
import json

import pandas as pd

from requests import get
from time import sleep

## API for People and planets
url = "https://swapi.dev/api/people/"
url_home = "https://swapi.dev/api/planets/"

## List to store Starwar data
starwars = []

## For loop
for i in range(15):
    index = i + 1

    new_url = url + str(index)
    resp = get(new_url).json()

    new_home_url = url_home + str(index)
    resp2 = get(new_home_url).json()

    name = resp["name"]
    height = resp["height"]
    weight = resp["mass"]
    hair_color = resp ["hair_color"] if resp["hair_color"] != "n/a" else "N/A"
    birth = resp["birth_year"]
    gender = resp["gender"] if resp["gender"] != "n/a" else "N/A"
    homeworld = resp2["name"]

    starwars.append([name, height, weight, hair_color, birth, gender, homeworld])
    sleep(1)


# Write CSV file
with open("starwars.csv", mode = "w", newline = "") as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(["name", "height", "weight", "hair_color", "birth", "gender", "homeworld"])
    csv_writer.writerows(starwars)


# Open CSV file
starwar = pd.read_csv("starwars.csv")

starwar
