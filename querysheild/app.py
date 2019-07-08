from flask import Flask


def run():
    app = Flask(__name__)
    print("I am alive!")
    app.run()