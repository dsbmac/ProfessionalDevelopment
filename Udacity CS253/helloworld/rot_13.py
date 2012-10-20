import cgi
import webapp2
import string
from string import maketrans

form = """
  <form method="post">
    <textarea name="text" style="height: 100px; width: 400px;" >%(text)s </textarea>
    <input type="submit">
  </form>
"""

class MainPage(webapp2.RequestHandler):
    def write_form(self, text=""):
        self.response.out.write( form % { "text":text} )
    def get(self):
        self.write_form()
    def post(self):
        user_text = self.request.get('text')
        text = rot_13(user_text)
        self.write_form( cgi.escape(text, quote = True) )

def rot_13(text):
    intab = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    outtab = "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM"
    trantab = maketrans(intab, outtab)
    return str(text).translate(trantab)

##        self.response.out.write('<html><body>You wrote:<pre>')
##        self.response.out.write(cgi.escape(self.request.get('text')))
##        self.response.out.write('</pre></body></html>')

app = webapp2.WSGIApplication([('/', MainPage)],
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




