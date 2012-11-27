def score(c):
	c = sorted(c)
	v = [x for x, y in c][::-1]
	#v = [x for x, y in c]
	print "v:", v
	if len(set(y for x, y in c)) == 1:	# flush
		if v[0] - v[4] == 4:			# straight flush
			if v[0] == 12:				# royal flush
				return 90000, v
			return 80000, v
		return 50000, v
	if len(set(v)) == 5 and v[0] - v[4] == 4:	# straight
		return 40000, v
	s = sorted((v.count(x), x) for x in set(v))[::-1]
	if s[0][0] == 4:					# four of a kind
		return 70000 + s[0][1], v
	elif s[0][0] == 3:					# three of a kind
		if s[1][0] == 2:				# full house
			return 60000 + s[0][1] * 100 + s[1][1], v
		return 30000 + s[0][1], v
	elif s[0][0] == 2:					# one pair
		if s[1][0] == 2:				# two pairs
			return 20000 + s[0][1] * 100 + s[1][1], v
		return 10000 + s[0][1], v
	return 0, v							# nothing

counter = 0
for line in open("poker.txt"):
        cards = [("23456789TJQKA".find(x), y) for x,y in line.split()]        
        print cards
        counter += score(cards[:5]) > score(cards[5:])
print counter
