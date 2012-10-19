from google.appengine.ext import webapp2
from google.appengine.ext.webapp.util import run_wsgi_app
from valid_date import *

form="""
<form method="post">
  What is your birthday?
  <br>
  <label> Month
  <input type="text" name="month" value="%(month)s"></label>
  <label> Day
  <input type="text" name="day" value="%(day)s"></label>
  <label> Year
  <input type="text" name="year" value="%(year)s"></label>
  <div>%(error)s</div>
  <br>
  <br>
  <input type="submit">
</form>
"""

class MainPage(webapp2.RequestHandler):
    def write_form(self, error="",month="", day="", year=""):
        self.response.out.write(form % {"error":error,
                                        "month":month,
                                        "day":day,
                                        "year":year})
    def get(self):
        self.write_form()
    def post(self):
        user_month = self.request.get('month')
        user_day = self.request.get('day')
        user_year = self.request.get('year')

        month = valid_month(user_month)
        day = valid_day(user_day)
        year = valid_year(user_year)

        if not (month and day and year):
            self.write_form("That's wrong buddy", user_month, user_day, user_year)
        else:
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
        
application = webapp2.WSGIApplication([('/', MainPage)], debug=True)

def main():
    run_wsgi_app(application)

if __name__ == "__main__":
    main()




