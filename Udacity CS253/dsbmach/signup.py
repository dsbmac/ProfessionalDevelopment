import webapp2
import cgi

#cgi.escape(s, quote=True)

import validation

form = """
<form method="post">
    Signup
    <br>
    <label>
        Username
          <input type = "text" name="username" value="%(username)s">
    </label>
    <br>
    <label>
        Password
            <input type="password" name="password" value="%(password)s">
    </label>
    <br>
    <label>
        Verify Password
            <input type="password" name="verifyPassword" value="%(verifyPassword)s">
    </label>
    <br>
    <label>
        Email (optional)
            <input type = "text" name="email" value="%(email)s">
    </label>
    <div style="color: red">%(error)s</div>
    <br>
    <input type="submit">
    <br>
</form>

"""

class MainPage(webapp2.RequestHandler):
    def write_form(self, username="", password="", verifyPassword="", email="", error=""):
        self.response.out.write(form % {"username": username, "password":password,  "verifyPassword": verifyPassword, "email":email,"error":error })
    def get(self):
        self.write_form()
    def post(self):
        user_username = self.request.get('username') 
        user_password = self.request.get('password')
        user_verifyPassword = self.request.get('verifyPassword')
        user_email = self.request.get('email')

        #validate entries
        username  = validation.valid_username( user_username )
        password = validation.valid_password( user_password )
        verifyPassword = validation.valid_verifyPassword( user_verifyPassword )
        email = validation.valid_email( user_email )
        #escape text        
        username = cgi.escape( username, quote=True)
        password = cgi.escape( password, quote=True)
        verifyPassword = cgi.escape( verifyPassword, quote=True)
        email  = cgi.escape(email, quote=True)
        
        if not ( month and day and year):
            self.write_form(username, password, verifyPassword, email,
                            "That doesn't look good.")
        else:
            self.redirect("/thanks")
            
class ThanksHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write("Thanks, Have a great day!")

app = webapp2.WSGIApplication([('/cs253/signup', MainPage),
                               ('/thanks', ThanksHandler)],
                              debug=True)
