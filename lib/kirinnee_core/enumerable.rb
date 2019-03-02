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
end