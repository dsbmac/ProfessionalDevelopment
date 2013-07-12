import webapp2

form = """
<form>
    <input type="password" name="password" >
    <input type="submit">
</form>
<br>
<form>
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
    <input type="checkbox" name="chq1" >
    <input type="checkbox" name="chq2" >
    <input type="checkbox" name="chq3" >
    <input type="checkbox" name="chq4" >
    <br>
    <input type="submit">
</form>
<br>
<form>
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
<form method="post" action="/testform">
    <input name="q">
    <input type="submit">
</form>

"""

class MainPage(webapp2.RequestHandler):
    def get(self):
        self.response.out.write(form)

class TestHandler(webapp2.RequestHandler):
    def get(self):
        q = self.request.get("q")
        self.response.out.write(q)

app = webapp2.WSGIApplication([('/', MainPage),TestHandler)],
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


