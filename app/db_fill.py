# -*- coding: utf-8 -*-

from app import app, db
from app.models import User, Book, Log, Role

app_ctx = app.app_context()
app_ctx.push()
db.create_all()
Role.insert_roles()

admin = User(name=u'root', email='root@gmail.com', password='password', major='administrator',
             headline=u"Administrator", about_me=u"Administrator")
user1 = User(name=u'MC', email='madeleine@madeleine.com', password='123456', major='Media', headline=u"User")
user2 = User(name=u'test', email='test@test.com', password='123456')
user3 = User(name=u'Caroline', email='caroline@yahoo.com', password='123456')
user4 = User(name=u'Helena', email='helena.lingor@leuphana.de', password='hylynyiv', headline=u"Teaching and Research Associate")

book1 = Book(title=u"La La Land (2016)", subtitle=u"Here's to the fools who dream", author=u"Ryan Gosling and Emma Stone", isbn='3783958',
             tags_string=u"Comedy,Drama,Music,Musical,Romance", image='https://m.media-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_SY1000_SX675_AL_.jpg',
             summary=u"""Aspiring actress serves lattes to movie stars in between auditions and jazz musician Sebastian scrapes by playing cocktail-party gigs in dingy bars. But as success mounts, they are faced with decisions that fray the fragile fabric of their love affair, and the dreams they worked so hard to maintain in each other threaten to rip them apart.""")
book2 = Book(title=u"The Silence of the Lambs (1991)", subtitle=u"Prepare yourself for the most exciting, mesmerising and terrifying two hours of your life!", author=u" Jodie Foster,Anthony Hopkins,Lawrence A. Bonney", isbn='0102926',
             tags_string=u"Crime,Drama,Thriller", image='https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg',
             summary=u"""FBI trainee Clarice Starling works hard to advance her career, while trying to hide/put behind her West Virginia roots, of which if some knew, would automatically classify her as being backward or white trash. After graduation, she aspires to work in the agency's Behavioral Science Unit under the leadership of Jack Crawford. While she is still a trainee, Crawford asks her to question Dr. Hannibal Lecter, a psychiatrist imprisoned, thus far, for eight years in maximum security isolation for being a serial killer who cannibalized his victims. Clarice is able to figure out the assignment is to pick Lecter's brains to help them solve another serial murder case, that of someone coined by the media as Buffalo Bill, who has so far killed five victims, all located in the eastern US, all young women who are slightly overweight (especially around the hips), all who were drowned in natural bodies of water, and all who were stripped of large swaths of skin. She also figures that Crawford chose ...""")
book3 = Book(title=u"Interstellar (2014)", subtitle=u"Mankind's next step will be our greatest.",
             author=" Matthew McConaughey, Anne Hathaway, Jessica Chastain", isbn="0816692",
             tags_string=u" Adventure,Drama,Sci-Fi", image='https://m.media-amazon.com/images/M/MV5BZjdkOTU3MDktN2IxOS00OGEyLWFmMjktY2FiMmZkNWIyODZiXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SY1000_SX675_AL_.jpg',
             summary=u"""Earth's future has been riddled by disasters, famines, and droughts. There is only one way to ensure mankind's survival: Interstellar travel. A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.""")
book4 = Book(title=u"Coco (2017)", author=" Anthony Gonzalez, Gael García Bernal, Benjamin Bratt", isbn="2380307",
             tags_string=u"Animation,Adventure,Comedy,Family,Fantasy,Music,Mystery", image='https://m.media-amazon.com/images/M/MV5BYjQ5NjM0Y2YtNjZkNC00ZDhkLWJjMWItN2QyNzFkMDE3ZjAxXkEyXkFqcGdeQXVyODIxMzk5NjA@._V1_SY1000_CR0,0,699,1000_AL_.jpg',
             summary=u"""Despite his family's baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel's family history.""")
book5 = Book(title=u"Hacksaw Ridge (2016)", subtitle=u"When the order came to retreat, one man stayed.", author=u" Andrew Garfield, Sam Worthington, Luke Bracey",
             isbn="2119532", tags_string=u"Biography,Drama,History,War", image='https://m.media-amazon.com/images/M/MV5BMjQ1NjM3MTUxNV5BMl5BanBnXkFtZTgwMDc5MTY5OTE@._V1_SY1000_CR0,0,647,1000_AL_.jpg',
             summary=u"""The true story of Desmond T. Doss, the conscientious objector who, at the Battle of Okinawa, was awarded the Medal of Honor for his incredible bravery and regard for his fellow soldiers. We see his upbringing and how this shaped his views, especially his religious view and anti-killing stance. We see Doss's trials and tribulations after enlisting in the US Army and trying to become a medic. Finally, we see the hell on Earth that was Hacksaw Ridge.""")
book6 = Book(title=u"The Magnificent Seven (2016)",
             author=" Denzel Washington, Chris Pratt, Ethan Hawke",
             isbn="2404435", tags_string=u" Action,Adventure,Western", image='https://m.media-amazon.com/images/M/MV5BMTUzNTc0NTAyM15BMl5BanBnXkFtZTgwMTk1ODA5OTE@._V1_SY1000_CR0,0,675,1000_AL_.jpg',
             summary=u"Director Antoine Fuqua brings his modern vision to a classic story in The Magnificent Seven. With the town of Rose Creek under the deadly control of industrialist Bartholomew Bogue, the desperate townspeople employ protection from seven outlaws, bounty hunters, gamblers and hired guns. As they prepare the town for the violent showdown that they know is coming, these seven mercenaries find themselves fighting for more than money.")
logs = [Log(user1, book2), Log(user1, book3), Log(user1, book4), Log(user1, book6),
        Log(user2, book1), Log(user2, book3), Log(user2, book5),
        Log(user3, book2), Log(user3, book5)]

db.session.add_all([admin, user1, user2, user3, user4, book1, book2, book3, book4, book5, book6] + logs)
db.session.commit()

app_ctx.pop()
