import cgi
import webapp2
import string

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
##
##form="""
##<form method="post">
##  <textarea name="text" style="height:100px; width:400px" value="%(text)s">
##  </textarea>
##  <br>
##  <input type="submit">
##</form>
##"""
##
##class MainPage(webapp.RequestHandler):
##    def get(self):
##        #self.response.headers['Content-Type'] = 'text/plain'
##        self.write_form()
##
##    def write_form(self, text=''):
##        user_text = self.request.get('text')
##        self.response.out.write(form % {'text':user_text})
##
##    def post(self):
##
##        self.write_form()
##        if self.request.get('text') == '':            
##            self.response.out.write("No input")
##
##    def rot13(self):
##        intab = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
##        outtab = "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM"
##        trantab = maketrans(intab, outtab)
##        
##application = webapp2.WSGIApplication([('/', MainPage)], debug=True)
##
##def main():
##    run_wsgi_app(application)
##
##if __name__ == "__main__":
##    main()




