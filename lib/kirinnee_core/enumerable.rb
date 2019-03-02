module Enumerable

	# Filters base on predicate passed via block.
	# Variant of "select, filter, find all" method in vanilla ruby
	# Does not modify the original array or enumerable
	#
	# [1,2,3].where { |x| x%2!=0 } # => [1,3]
	#
	# @param [Block] f predicate
	# @return [Enumerable]
	def where(&f)
		select &f
	end

	# Filters base on predicate passed via block.
	# Variant of "select, filter, find all" method in vanilla ruby
	# Modifies the original array or enumerable
	#
	# [1,2,3].where! { |x| x%2!=0 } # => [1,3]
	#
	# @param [Block] f predicate
	# @return [Enumerable]
	def where!(&f)
		select! &f
	end

	# Skips the first x elements of the enumerable
	# Does not mutate the original enumerable
	#
	# [1,2,3,4,5].skip 3 #=> [4,5]
	# {:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}.skip 3 #=> {:d=>4, :e=>5}
	#
	#
	# @param [Integer] x the number of elements to skip
	# @return [Enumerable]
	def skip(x)
		drop(x)
	end

	# Skips the elements of the enumerable while the predicate evaluates to true
	# Dies not mutate the original enumerable
	#
	# [1,2,3,2,1,0].skip_while {|x| x < 3} # => [3,2,1,0]
	#
	# @param [Block] p predicate to decide whether to skip
	# @return [Enumerable]
	def skip_while(&p)
		drop_while(&p)
	end
end