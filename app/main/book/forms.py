# -*- coding:utf-8 -*-
from app.models import Book
from flask_pagedown.fields import PageDownField
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, IntegerField
from wtforms import ValidationError
from wtforms.validators import Length, DataRequired, Regexp


class EditBookForm(FlaskForm):
    isbn = StringField(u"IMDb#",
                       validators=[DataRequired(message=u"This item forgot to fill in!"),
                                   Regexp('[0-9]{13,13}', message=u"IMDb# must be 13 digits")])
    title = StringField(u"title",
                        validators=[DataRequired(message=u"Please fill it out!"), Length(1, 128, message=u"1 to 128 characters in length")])
    #origin_title = StringField(u"Original name", validators=[Length(0, 128, message=u"0 to 128 characters in length")])
    subtitle = StringField(u"Subtitle", validators=[Length(0, 128, message=u"0 to 128 characters in length")])
    author = StringField(u"Stars", validators=[Length(0, 128, message=u"0 to 64 characters in length")])
    #translator = StringField(u"Translater", validators=[Length(0, 64, message=u"0 to 64 characters in length")])
    #publisher = StringField(u"Publisher", validators=[Length(0, 64, message=u"0 to 64 characters in length")])
    image = StringField(u"Cover Address", validators=[Length(0, 128, message=u"0 to 128 characters in length")])
    #pubdate = StringField(u"Publish Date", validators=[Length(0, 32, message=u"0 to 32 characters in length")])
    tags = StringField(u"Tag", validators=[Length(0, 128, message=u"0 to 128 characters in length")])
    #pages = IntegerField(u"Pages")
    #price = StringField(u"Price", validators=[Length(0, 64, message=u"0 to 32 characters in length")])
    #binding = StringField(u"Binding", validators=[Length(0, 16, message=u"0 to 16 characters in length")])
    #numbers = IntegerField(u"Collection", validators=[DataRequired(message=u"Please fill it out!")])
    summary = PageDownField(u"Brief introduction")
    catalog = PageDownField(u"Catalogue")
    submit = SubmitField(u"Save Changes")

class AddBookForm(EditBookForm):
    def validate_isbn(self, filed):
        if Book.query.filter_by(isbn=filed.data).count():
            raise ValidationError(u'The same IMDb# already exists and cannot be entered. Please check carefully whether the movie is in record.')

class SearchForm(FlaskForm):
    search = StringField(validators=[DataRequired()])
    submit = SubmitField(u"Search")


