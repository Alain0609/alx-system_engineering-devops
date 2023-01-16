#!/usr/bin/python3
"""Returns to-do list information for a given employee ID."""
import csv
import requests
import sys


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"
    user_id = sys.argv[1]

    user = requests.get("{}/users/{}".format(url, user_id)).json()
    todos = requests.get(url + "/todos", params={"userId": user_id}).json()

    username = user.get('username')
    filename = user_id + ".csv"

    rows = []
    for data in todos:
        rows.append([user_id, username, data.get(
            'completed'), data.get('title')])

    with open(filename, "w", newline="") as csvfile:
        writer = csv.writer(csvfile, delimiter=',',
                            quotechar='"', quoting=csv.QUOTE_ALL)
        [writer.writerow(row) for row in rows]
