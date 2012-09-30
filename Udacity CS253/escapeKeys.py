# User Instructions
# 
# Implement the function escape_html(s), which replaces:
# > with &gt;
# < with &lt;
# " with &quot;
# & with &amp;
# and returns the escaped string
# Note that your browser will probably automatically 
# render your escaped text as the corresponding symbols, 
# but the grading script will still correctly evaluate it.
# 

def escape_html(s):
    escapeDict = {'>':'gt;', '<' : 'lt;' , '"':  '&quot;', '&' : '&amp;'}
    result = ''
    for char in s:
        if char in escapeDict:
            string = escapeDict[char]
        else:
            string = char
        result += string
    return result

s= 'sdfe &'
print escape_html(s)
    


