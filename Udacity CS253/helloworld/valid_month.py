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
    
print valid_month('')

# valid_month("january") => "January"    
# valid_month("January") => "January"
# valid_month("foo") => None
# valid_month("") => None

