from string import maketrans

intab = "abcdefghijklmnopqrstuvwxyz"
outtab = "nopqrstuvwxyzabcdefghijklm"
trantab = maketrans(intab, outtab)

str = "Hello"
str2 = 'uryyb'
print str.translate(trantab)
print str2.translate(trantab)
