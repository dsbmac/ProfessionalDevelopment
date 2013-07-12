class Numeric
  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)    
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(symbol)
    singular_currency = symbol.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end

end

class String
  # YOUR CODE HERE
  def palindrome?    
      str = self.gsub(/\W/, '').downcase
    if str.length == 1
      return true  
    elsif str[0] == str[-1..-1]
      if str.length == 2
        return true
      else    
        a = str[1...-1]
        return a.palindrome?
     end
    else
      return false
    end
  end
end

module Enumerable
  # YOUR CODE HERE
  def palindrome?
    if self.class != Array
      newSelf = self.collect {|i| i}
      newSelf.palindrome?
    else
      if self.length == 1
        return true  
      elsif self[0] == self[-1]
        if self.length == 2
          return true
        else    
          newSelf = self[1...-1]
          return newSelf.palindrome?
        end  
      else 
        return false
      end
    end
  end
end