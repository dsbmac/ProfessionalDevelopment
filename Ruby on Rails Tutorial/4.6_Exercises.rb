#ex 1
def string_shuffle(s)
	s.split('').shuffle.join
end

puts string_shuffle("low me")

#ex 2
class String
	def shuffle
		self.split('').shuffle.join
	end
end

puts "sexy".shuffle

#ex 3
 person1 = {first: "D", last:"Man"}
 person2 = {first: "F", last:"Man"}
 person3 = {first: "G", last:"Force"}
 params = {father:person1, mother:person2, child:person3}

 puts params[:father][:first]

 #ex 4
