from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from string import maketrans

form="""
<form method="post">
  <textarea name="text" style="height:100px; width:400px" value="%(text)s">
  </textarea>
  <br>
  <input type="submit">
</form>
"""

class MainPage(webapp.RequestHandler):
    def get(self):
        #self.response.headers['Content-Type'] = 'text/plain'
        self.write_form()

    def write_form(self, text=''):
        user_text = self.request.get('text')
        self.response.out.write(form % {'text':user_text})

    def post(self):

        self.write_form()
        if self.request.get('text') == '':            
            self.response.out.write("No input")

    def rot13(self):
        intab = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        outtab = "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM"
        trantab = maketrans(intab, outtab)
        
application = webapp.WSGIApplication([('/', MainPage)], debug=True)

def main():
    run_wsgi_app(application)

if __name__ == "__main__":
    main()




