#!/usr/bin/python3
"""Returns to-do list information for a given employee ID."""
import requests
import sys


if __name__ == '__main__':
    url = "https://jsonplaceholder.typicode.com"
    employee_id = sys.argv[1]

    user = requests.get("{}/users/{}".format(url, employee_id)).json()
    todos = requests.get(url + "/todos", params={"userId": employee_id}).json()

    completed = [data.get('title')
                 for data in todos if data.get('completed') is True]

    total_number_of_task = len(todos)
    number_of_done_task = len(completed)
    employee_name = user.get('name')

    print("Employee {} is done with tasks({}/{}):".format(employee_name,
          number_of_done_task, total_number_of_task))
    [print("\t {}".format(title)) for title in completed]
