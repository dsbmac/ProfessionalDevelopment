def combine_anagrams(words)
	d = Hash.new
	words.each do |x|		
		key = x.downcase.chars.sort { |a, b| a.casecmp(b) } .join
		unless d.has_key?(key)
			d[key] = []
		end
		d[key] << x
	end
	return d.values
end



