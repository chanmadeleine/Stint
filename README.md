<p align="center"><img src="https://user-images.githubusercontent.com/39877134/54490688-516a7d00-488e-11e9-82fa-89c19ba0091f.png" alt="Stint" height="200px"></p>

# Stint
Simple Movie application written on flask with SQLite database.

## Features
* write/delete reviews
* add/delete films, update film information
* administrator delete reviews

## Screen Shot
Index page:
![index page](https://user-images.githubusercontent.com/39877134/54490656-fd5f9880-488d-11e9-8eab-0263a7118706.png)

Movie list page:
![movie list page](https://user-images.githubusercontent.com/39877134/54490658-15371c80-488e-11e9-9543-fc71489fec76.png)

Movie detail page:
![movie detail page](https://user-images.githubusercontent.com/39877134/54490664-21bb7500-488e-11e9-942b-4931eb45076e.png)

## Installation
```sh
git clone https://github.com/chanmadeleine/Stint.git
cd Stint
python3 -m env venv
source ./env/bin/activate
pip install -r requirements.txt
python3 ./run.py
```

Press CTRL+C to terminate the server.  
use `deactive` to quit the virtual environment.

#### Credits
[Akari, Simple Book library](https://github.com/magic-akari/BookLibrary)  
[Shinya Baba, Book management](https://logics-of-blue.com/visual-studio-flask-book-management-crud/)

## Dependencies

- [Flask](https://github.com/mitsuhiko/flask)
- [SQLAlchemy](https://github.com/zzzeek/sqlalchemy)
- [Flask-SQLAlchemy](https://github.com/mitsuhiko/flask-sqlalchemy)
- [Flask-Login](https://github.com/maxcountryman/flask-login)
- [Flask-WTF](https://github.com/lepture/flask-wtf)
- [Bootstrap](http://getbootstrap.com/)
- [Flask-Bootstrap](https://github.com/mbr/flask-bootstrap)
- [Markdown](https://pythonhosted.org/Markdown/)
- [Flask-PageDown](https://github.com/miguelgrinberg/Flask-PageDown)
- [Flask-Uploads](https://packages.python.org/Flask-Uploads/)
- [Bootstrap File Input](https://github.com/kartik-v/bootstrap-file-input)

## LICENSE
The MIT License (MIT)

Copyright (c) 2019 MC :octocat:

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
