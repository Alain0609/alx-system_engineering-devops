#!/usr/bin/python3
"""Returns to-do list information for a given employee ID."""
import json
import requests
import sys


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"
    user_id = sys.argv[1]

    user = requests.get("{}/users/{}".format(url, user_id)).json()
    todos = requests.get(url + "/todos", params={"userId": user_id}).json()

    username = user.get('username')

    dict = {}
    data = []

    for todo in todos:
        data.append({'task': todo.get('title'),
                    'completed': todo.get('completed'), 'username': username})

    dict[user_id] = data

    filename = user_id + ".json"
    with open(filename, "w", encoding="utf-8") as json_file:
        json_text = json.dumps(dict)
        json_file.write(json_text)
