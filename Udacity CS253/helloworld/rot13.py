import cgi
import webapp2
import string

from google.appengine.api import users

form = """
          <html>
            <body>
              <form method="post">
                <div><textarea name="text" value ="%(txt)s" rows="3" cols="60"></textarea></div>
                <div><input type="submit" value="Sign Guestbook"></div>
              </form>
            </body>
          </html>"""

class MainPage(webapp2.RequestHandler):
    def write_form(self, txt=""):
        self.response.out.write(form % { "txt":txt} )
    def get(self):
        self.write_form()
    def post(self):
        user_text = self.request.get('text')
        #text = user_text.upper()
        self.write_form('sdfsdf')
        
##        self.response.out.write('<html><body>You wrote:<pre>')
##        self.response.out.write(cgi.escape(self.request.get('text')))
##        self.response.out.write('</pre></body></html>')


app = webapp2.WSGIApplication([('/', MainPage)],
                              debug=True)

def main():
    run_wsgi_app(app)

if __name__ == "__main__":
    main()

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




