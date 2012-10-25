import webapp2
import cgi

#cgi.escape(s, quote=True)

import validation

newpostForm = """
<form method="post">
    Signup
    <br>
    <label>
        Username
          <input type = "text" name="username" value="%(username)s"> %(username_error)s
    </label>
    <br>
    <label>
        Password
            <input type="password" name="password" value="%(password)s"> %(password_error)s
    </label>
    <br>
    <label>
        Verify Password
            <input type="password" name="verify" value="%(verify)s"> %(verify_error)s
    </label>
    <br>
    <label>
        Email (optional)
            <input type = "text" name="email" value="%(email)s"> %(email_error)s
    </label>
    
    <br>
    <input type="submit">
    <br>
</form>

"""

form = """
<form method="post">
    Signup
    <br>
    <label>
        Username
          <input type = "text" name="username" value="%(username)s"> %(username_error)s
    </label>
    <br>
    <label>
        Password
            <input type="password" name="password" value="%(password)s"> %(password_error)s
    </label>
    <br>
    <label>
        Verify Password
            <input type="password" name="verify" value="%(verify)s"> %(verify_error)s
    </label>
    <br>
    <label>
        Email (optional)
            <input type = "text" name="email" value="%(email)s"> %(email_error)s
    </label>
    
    <br>
    <input type="submit">
    <br>
</form>

"""

class MainPage(webapp2.RequestHandler):
    
    def write_form(self, username="", password="", verify="", email="", username_error='',
                            password_error='', verify_error='', email_error='' ):        
        self.response.out.write( form % {"username": username, "password":password,
                                        "verify": verify, "email":email, "username_error": username_error,
                                         "password_error":password_error, "verify_error": verify_error,
                                         "email_error":email_error })
    def get(self):
        self.write_form()
    def post(self):
        user_username = self.request.get('username') 
        user_password = self.request.get('password')
        user_verify = self.request.get('verify')
        user_email = self.request.get('email')

        #validate entries
        username  = validation.valid_username( user_username )
        password = validation.valid_password( user_password )
        verify = validation.valid_verify( user_verify, user_password )
        if user_email:
            email = validation.valid_email( user_email )
        else:
            email = True
        
        if not ( username and password and verify and email):
            errorMsg = "Invalid."
            username_error, password_error, verify_error, email_error = ('','','','')
            if not username:
                username_error = errorMsg
            if not password:
                password_error = errorMsg
            if not verify:
                verify_error = errorMsg
            if not email:
                email_error = errorMsg
            #escape text        
            username = cgi.escape( user_username, quote=True)
            password = cgi.escape( user_password, quote=True)
            verify = cgi.escape( user_verify, quote=True)
            email  = cgi.escape(user_email, quote=True)
            self.write_form(username, password, verify, email, username_error,
                            password_error, verify_error, email_error )
        else:
            self.redirect("/welcome?username=" + username)

classNewPost(webapp2.RequestHandler):
    def post(self):
class WelcomeHandler(webapp2.RequestHandler):
    def get(self):
        self.response.out.write("Thanks, Have a great day!")

app = webapp2.WSGIApplication([('/signup', MainPage),
                               ('/welcome', WelcomeHandler)],
                              debug=True)
