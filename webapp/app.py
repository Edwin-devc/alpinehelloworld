import os

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello world! Here to see if the changes sent to github are picked up'

if __name__ == '__main__':
    app.run(host='0.0.0.0')
