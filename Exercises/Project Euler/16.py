
def p20():
    result = 0
    s = str(2**1000)
    for c in s:
        result += int(c)

    return result
    

print p20()
