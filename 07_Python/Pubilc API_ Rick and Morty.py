# Import module
import csv
import json

import pandas as pd

from requests import get

# API for episodes
url_e = "https://rickandmortyapi.com/api/episode?page="

# List to store episode data
episodes = []

# Starting page number (Adjust as needed)
start_page = 1

# Number of pages to retrieve (Adjust as needed)
num_pages = 3  # Change this value to retrieve from more pages

# For loop (Loop through desired number of pages)
for page_number in range(start_page, start_page + num_pages):

    # Build episode URL with page number
    episode_url = f"{url_e}{page_number}"

    # Make API request and handle potential errors (optional)
    resp = get(episode_url)
    if resp.status_code == 200:
        data = resp.json()
    else:
        print(f"Error: Failed to retrieve episode data for page {page_number}")
        continue  # Skip to next iteration if error

    # Extract data from each episode in the response
    for episode in data["results"]:
        episode_id = episode["id"]
        episode_name = episode["name"]
        air_date = episode["air_date"]
        episode_number = episode["episode"]

        # Append episode data to the list
        episodes.append([episode_id, episode_name, air_date, episode_number])

# Write CSV file
with open("episodes.csv", mode = "w", newline = "") as file:
    csv_writer = csv.writer(file)
    csv_writer.writerow(["episode_id", "episode_name", "air_date", "episode_number"])
    csv_writer.writerows(episodes)

# Open CSV file
episode = pd.read_csv("episodes.csv")

episode
