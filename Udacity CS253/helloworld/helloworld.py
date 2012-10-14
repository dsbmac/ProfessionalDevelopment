import cgi
import webapp2

from google.appengine.api import users

class MainPage(webapp2.RequestHandler):
    def get(self):
        self.response.out.write("""
          <html>
            <body>
              <form action="/sign" method="post">
                <div><textarea name="content" rows="3" cols="60"></textarea></div>
                <div><input type="submit" value="Sign Guestbook"></div>
              </form>
            </body>
          </html>""")


class Guestbook(webapp2.RequestHandler):
    def post(self):
        self.response.out.write('<html><body>You wrote:<pre>')
        self.response.out.write(cgi.escape(self.request.get('content')))
        self.response.out.write('</pre></body></html>')

app = webapp2.WSGIApplication([('/', MainPage),
                              ('/sign', Guestbook)],
                              debug=True)

##from google.appengine.ext import webapp
##from google.appengine.ext.webapp.util import run_wsgi_app
##
##form="""
##<form method="post" action = "/testform">
##  <input name="q">
##  <input type="submit">
##
##</form>
##"""
##
##class MainPage(webapp.RequestHandler):
##    def get(self):
##        #self.response.headers['Content-Type'] = 'text/plain'
##        self.response.out.write(form)
##
##class TestHandler(webapp.RequestHandler):
##    def post(self):
##        q = self.request.get("q")
##        self.response.out.write(q)
##        
####        self.response.headers['Content-Type'] = 'text/plain'
####        self.response.out.write(self.request)
##        
##application = webapp.WSGIApplication(
##                                     [('/', MainPage),
##                                     ('/testform', TestHandler)],
##                                     debug=True)
##
##def main():
##    run_wsgi_app(application)
##
##if __name__ == "__main__":
##    main()


