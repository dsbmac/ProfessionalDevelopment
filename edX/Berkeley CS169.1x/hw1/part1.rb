#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  # YOUR CODE HERE
  str = str.gsub(/\W/, '').downcase
  if str.length == 1
  	return true  
  elsif str[0] == str[-1..-1]
  	if str.length == 2
  		return true
  	else  	
	  	a = str[1...-1]
	  	return palindrome?(a)
	 end
  else
  	return false
  end
end

def count_words(str)
  # YOUR CODE HERE
  result = {}
  #str = str.gsub(/\W/, '').downcase
  m = str.downcase.scan(/\w+\b/)
  m.each do |x|
  	if result.has_key?(x)
  		result[x] +=1
  	else
  		result[x] = 1
  	end
  end
  return result
end
