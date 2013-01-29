class CartesianProduct
  include Enumerable

  def initialize(xs, ys)
  	@xs = xs
  	@ys = ys
  end

  def each
  	unless @xs == [] or @ys == []
  		xs_index = 0   		
  		while xs_index < @xs.length
  			ys_index = 0
  			while ys_index < @ys.length
  				yield [@xs[xs_index] , @ys[ys_index]]
  				ys_index +=1 
  			end
  			xs_index +=1
  		end		
  	end  
end
end

x = [1,2,3]
print x
x.send :[]=,2,2
print x
c = x[0] + x.[](1) + x.send(:[],2)