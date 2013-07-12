#!/usr/bin/env python

from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
import os
import webapp2

import jinja2

jinja_environment = jinja2.Environment(autoescape=True,
    loader=jinja2.FileSystemLoader(os.path.join(os.path.dirname(__file__), 'templates')))

class MainPage(webapp2.RequestHandler):
    def get(self):
        template_values = {
            'name': 'Denis',
            'verb': 'feel'
        }

        template = jinja_environment.get_template('index.html')
        self.response.out.write(template.render(template_values))

class NewPost(webapp2.RequestHandler):
    def get(self):
        template_values = {
            'name': 'Jimmy',
            'verb': 'am sexin',
            'text': 'Enter text'
        }

        template = jinja_environment.get_template('newpost.html')
        self.response.out.write(template.render(template_values))
        
class TestHandler(webapp2.RequestHandler):
    def post(self):
        q = self.request.get("q")
        self.response.out.write(q)
                
app = webapp.WSGIApplication(
    [('/', MainPage),
     ('/newpost', NewPost)],
    debug=True)


