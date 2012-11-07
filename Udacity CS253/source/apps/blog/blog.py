#!/usr/bin/env python

#from google.appengine.ext.webapp.util import run_wsgi_app
import os
import webapp2
import jinja2
from google.appengine.ext import db

template_dir = os.path.join(os.path.dirname(__file__),'..', '..', 'templates')
jinja_env = jinja2.Environment(autoescape=True,
    loader=jinja2.FileSystemLoader(template_dir))

class Handler(webapp2.RequestHandler):
    def write(self, *a, **kw):
        self.response.out.write(*a, **kw)
        
    def render_str(self, template, **params):
        t = jinja_env.get_template(template)
        return t.render(params)

    def render(self, template, **kw):
        self.write(self.render_str(template, **kw))

class Art(db.Model):
    title = db.StringProperty(required = True)
    art =  db.TextProperty(required = True) #text allows for longer than 500 chars
    created = db.DateTimeProperty(auto_now_add = True)
    
class MainPage(Handler):
    def render_front(self, title='', art='', error=''):
        arts = db.GqlQuery("SELECT * "
                           "FROM Art")
                           #"ORDER BY created DESC")        
        self.render('blog.html', title=title, art=art, error=error, arts=arts)        
    def get(self):
        self.render_front()
    def post(self):
        title = self.request.get('title')
        art = self.request.get('art')

        if title and art:
            a = Art(title = title, art = art)
            a.put()

            self.redirect("/cs253/unit3/blog")
        else:
            error = 'there was an error'
            self.render_front(title = title, art = art, error = error)
        
                
app = webapp2.WSGIApplication( [('/', MainPage)], debug=True)

