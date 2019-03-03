# -*- coding:utf-8 -*-
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import Length, DataRequired, URL
from flask_pagedown.fields import PageDownField
from flask_wtf.file import FileField, FileAllowed
from app import avatars


class EditProfileForm(FlaskForm):
    name = StringField(u'User Name', validators=[DataRequired(message=u"Please fill out!"), Length(1, 64, message=u"1 to 64 characters")])
    major = StringField(u'Major', validators=[Length(0, 128, message=u"0 to 128 characters")])
    headline = StringField(u'Intro', validators=[Length(0, 32, message=u"32 characters")])
    about_me = PageDownField(u"Introducdtion")
    submit = SubmitField(u"Save Changes")


class AvatarEditForm(FlaskForm):
    avatar_url = StringField('', validators=[Length(1, 100, message=u"100 characters"), URL(message=u"Correct URL")])
    submit = SubmitField(u"Save")


class AvatarUploadForm(FlaskForm):
    avatar = FileField('', validators=[FileAllowed(avatars, message=u"Only pictures allowed")])
