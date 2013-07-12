import webapp2
import cgi

#cgi.escape(s, quote=True)

import valid_date

form = """
<form>
    Password
    <br>
    <input type="password" name="password" >
    <input type="submit">
</form>
<br>
<form>
    Dropdown
    <br>
    <select name="dd">
        <option value="1"> Dropdown One </option>
        <option value="2"> Dropdown Two </option>
        <option value="3"> Dropdown Three </option>
        </select>
        <br>
        <input type = "submit">
</form>
<br>
<form>
    Checkbox
    <br>
    <input type="checkbox" name="chq1" >
    <input type="checkbox" name="chq2" >
    <input type="checkbox" name="chq3" >
    <input type="checkbox" name="chq4" >
    <br>
    <input type="submit">
</form>
<br>
<form>
    Radio
    <br>
    <label>
        A
        <input type="radio" name="radio1" value="A">
    </label>
    <label>
        B
            <input type="radio" name="radio1" value="B">
    </label>
    <label>
        C
        <input type="radio" name="radio1" value="C">
    </label>
    <br>
    <input type="submit">
</form>
<br>
<form method="post">
    Input box
    <br>
    <input name="q">
    <input type="submit">
</form>
<form method="post">
    What is your birthday?
    <br>
    <label>
        Month
          <input type = "text" name="month" value="%(month)s">
    </label>
    <label>
        Day
            <input type = "text" name="day" value="%(day)s">
    </label>
    <label>
        Year
            <input type = "text" name="year" value="%(year)s">
    </label>
    <div style="color: red">%(error)s</div>
    <br>
    <br>
    <input type="submit">
</form>

"""

class MainPage(webapp2.RequestHandler):
    def write_form(self, error="", month="", day="", year=""):
        self.response.out.write(form % {"error": error, "month":cgi.escape(month, quote=True),
                                        "day":cgi.escape(day, quote=True), "year":cgi.escape(year, quote=True)})
    def get(self):
        self.write_form()
    def post(self):
        user_month = self.request.get('month') 
        user_day = self.request.get('day')
        user_year = self.request.get('year')

        month  = valid_date.valid_month( user_month )
        day = valid_date.valid_day( user_day )
        year = valid_date.valid_year( user_year )

        if not ( month and day and year):
            self.write_form("That doesn't look good.", user_month, user_day,
                            user_year)
        else:
            self.redirect("/thanks")
class ThanksHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write("Thanks, Have a great day!")

app = webapp2.WSGIApplication([('/', MainPage),
                               ('/thanks', ThanksHandler)],
                              debug=True)
