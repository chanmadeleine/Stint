from os import environ

from app import app

if __name__ == '__main__':
#    app.run(debug=True, host='0.0.0.0')
    HOST = environ.get('SERVER_HOST', 'localhost')
    try:
        PORT = int(environ.get('SERVER_PORT', '5555'))
    except ValueError:
        PORT = 5555
    #app.run(debug=True, host=HOST, port=PORT)
    app.run(host=HOST, port=PORT)

# Just for the fun, python easter eggs, spam and egg

# from __future__ import braces
# import this; print(this.s)
# import __hello__
# import antigravity
# from antigravity import geohash
# geohash(37.421542, -122.085589, b'2005-05-26-10458.68')

# and it's Monty Python not the reptile