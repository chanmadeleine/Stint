from datetime import datetime
from flask import render_template
from Main import app
from flask import Flask, url_for

@app.route('/')
@app.route('/home')
def home():
    now = datetime.now()
    formatted_now = now.strftime("%A, %d %B, %Y at %X")
### add_url_rule('/favicon.ico',
###                  redirect_to=url_for('static', filename='favicon.ico'))
###     html_content = "<html><head><title>Hello Flask</title></head><body>"
###     html_content += "<strong>Hello Flask!</strong> on " + formatted_now
###     html_content += "</body></html>"
    return render_template(
        "index.html",
        title = "Hello Flask",
        message = "Hello, Flask!",
        content = " on " + formatted_now)
###         content = "<strong>Hello, Flask!</strong> on " + formatted_now)
###     return html_content

### from flask import Flask
### from Main import app

### @app.route('/')
### @app.route('/home')
### def home():
###     return "Hello Flask!"

@app.route('/api/data')
def get_data():
  return app.send_static_file('data.json')

@app.route('/about')
def about():
    return render_template(
        "about.html",
        title = "About Stint",
        content = "app page for Flask.")

import os 
from flask import send_from_directory     

@app.route('/favicon.ico') 
def favicon(): 
    return send_from_directory(os.path.join(app.root_path, 'static'), 'favicon.ico', mimetype='image/vnd.microsoft.icon')