from google.appengine.ext import webapp
from google.appengine.ext.webapp.util import run_wsgi_app
from string import maketrans
import valid_date

form="""
<form method="post">
  What is your birthday?
  <br>
  <label> Month
  <input type="text" name="month">
  </label>
  <label> Day
  <input type="text" name="day">
  </label>
  <label> Year
  <input type="text" name="year">
  </label>
  <br>
  <br>
  <input type="submit">
</form>
"""

class MainPage(webapp.RequestHandler):
    def get(self):
        self.response.out.write(form)

##    def write_form(self, text=''):
##        user_month = 
##        user_text = self.request.get('text')
##        self.response.out.write(form % {'text':user_text})
##
    def post(self):
        user_month = valid_month(self.request.get('month'))
        self.response.out.write("Thanks")
##        user_month = valid_month(self.request.get('month'))
##
##        self.write_form()
##        if self.request.get('text') == '':            
##            self.response.out.write("No input")
##
##    def rot13(self):
##        intab = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
##        outtab = "nopqrstuvwxyzabcdefghijklmNOPQRSTUVWXYZABCDEFGHIJKLM"
##        trantab = maketrans(intab, outtab)
        
application = webapp.WSGIApplication([('/', MainPage)], debug=True)

def main():
    run_wsgi_app(application)

if __name__ == "__main__":
    main()




