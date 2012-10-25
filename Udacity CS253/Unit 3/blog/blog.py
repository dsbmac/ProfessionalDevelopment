from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app

form="""
<form method="post" action = "/newpost">
  <input name="q">
  <input type="submit">

</form>
"""

class MainPage(webapp.RequestHandler):
    def get(self):
        #self.response.headers['Content-Type'] = 'text/plain'
        self.response.out.write(form)

class TestHandler(webapp.RequestHandler):
    def post(self):
        q = self.request.get("q")
        self.response.out.write(q)
        
##        self.response.headers['Content-Type'] = 'text/plain'
##        self.response.out.write(self.request)
        
application = webapp.WSGIApplication(
                                     [('/', MainPage),
                                     ('/newpost', TestHandler)],
                                     debug=True)

def main():
    run_wsgi_app(application)

if __name__ == "__main__":
    main()


