import re

# -----------
# User Instructions
# 
# Modify the valid_month() function to verify 
# whether the data a user enters is a valid 
# month. If the passed in parameter 'month' 
# is not a valid month, return None. 
# If 'month' is a valid month, then return 
# the name of the month with the first letter 
# capitalized.
#

#date
months = ['January',
          'February',
          'March',
          'April',
          'May',
          'June',
          'July',
          'August',
          'September',
          'October',
          'November',
          'December']
          
def valid_month(month):
    if month:
        formattedMonth = month[0].upper() + month[1:].lower()
        if formattedMonth in months:
            return formattedMonth
    return None

def valid_day(day):
    if day.isdigit():
        n = int(day)
        if 1 <= n <= 31:
            return n
    return None

def valid_year(year):
    if year.isdigit() and 1900 <= int(year) <= 2020:
        return  int(year)
    return None

def valid_email(email):
    if year.isdigit() and 1900 <= int(email) <= 2020:
        return  int(email)
    return None

#signup 
USER_RE = re.compile(r"^[a-zA-Z0-9_-]{3,20}$")
PASSWORD_RE = re.compile(r "^.{3,20}$")
EMAIL_RE = re.compile(r"^[\S]+@[\S]+\.[\S]+$")
def valid_username(username):
    return USER_RE.match(username)
def valid_password(password, verifyPassword):
    return PASSWORD_RE.match(password) and password = verifyPassword
def valid_verifyPassword(verifyPassword,password):
    return PASSWORD_RE.match(verifyPassword) and password = verifyPassword
def valid_email(email):
    return EMAIL_RE.match(email)

# valid_month("january") => "January"    
# valid_month("January") => "January"
# valid_month("foo") => None
# valid_month("") => None

