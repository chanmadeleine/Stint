from flask import Flask
from Main import app

@app.route('/')
@app.route('/home')
def home():
    return "Hello Flask!"
