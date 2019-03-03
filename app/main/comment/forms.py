# -*- coding:utf-8 -*-
from flask_wtf import FlaskForm
from wtforms import SubmitField, TextAreaField
from wtforms.validators import Length, DataRequired


class CommentForm(FlaskForm):
    comment = TextAreaField(u"Your reviews",
                            validators=[DataRequired(message=u"Contents cannot be blank"), Length(1, 1024, message=u"Reviews are 1024 characters only")])
    submit = SubmitField(u"Post")
