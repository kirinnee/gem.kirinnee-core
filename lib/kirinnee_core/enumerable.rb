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
	# Does not mutate the original enumerable
	#
	# [1,2,3,2,1,0].skip_while {|x| x < 3} # => [3,2,1,0]
	#
	# @param [Block] p predicate to decide whether to skip
	# @return [Enumerable]
	def skip_while(&p)
		drop_while(&p)
	end

	# Takes the last x element of the enumerable
	# Does not mutate the original enumerable
	#
	# [1,2,3,4,5,6].back 3 #=> [4,5,6]
	# [1,2,3,4,5,6].back 100 #=> [1,2,3,4,5,6]
	# [1,2,3,4,5,6].back 0 #=> []
	#
	# @param [Integer] x the number of elements to take
	# @return [Enumerable]
	def back(x)
		reverse.take(x).reverse
	end

	# Takes the last x element while predicate evaluates to true
	# Does not mutate the original enumerable
	#
	# [1,2,3,2,1,0].back_while {|x| x <2} # => [1,0]
	#
	# @param [Block] p the predicate the to evaluate while considering to take the last element
	# @return [Enumerable]
	def back_while(&p)
		reverse_each.take_while(&p).reverse
	end

	# Omits the last x element of the enumerable
	# Does not mutate the original enumerable
	#
	# [1,2,3,4,5].omit 2 # => [1,2,3]
	# [1,2,3,4,5].omit 100 #=> []
	# [1,2,3,4,5].omit 0 # => [1,2,3,4,5]
	#
	# @param [Integer] x the number of elements to omit
	# @return [Enumerable]
	def omit(x)
		reverse_each.drop(x).reverse
	end

	# Omits the last element while the predicate evaluates to true
	# Does not mutate the original enumerable
	#
	# [1,2,3,2,1,0].omit_while { |x| x <3} #=> [1,2,3]
	#
	# @param [Block] p the predicate to evaluate to consider to remove the last element
	# @return [Enumerable]
	def omit_while(&p)
		reverse_each.drop_while(&p).reverse
	end

	# Removes all occurrences of the element within the enumerable
	# Does not mutate the original enumerable
	#
	# [1,2,3,1,2,3].remove 3 #=> [1,2,1,2]
	# %w(apple pear apple pear).remove "apple" #=> %w(pear pear)
	#
	# @param [Object] search the target to remove from the array
	# @return [Enumerable]
	def remove(search)
		where {|x| x != search}
	end

	# Whether the enumerable contains at least 1 element that matches the input
	#
	# [1,2,3,4,5,6,1].has? 1 # true
	# [1,2,3,4,5,6,1].has? 2 # true
	# [1,2,3,4,5,6,1].has? 7 # false
	#
	# @param [Object] search target
	# @return [Boolean]
	def has?(search)
		count(search) > 0
	end

	# Remove all occurrences of each element in provided array from target array
	#
	# [1,2,3,4,1,2,3,4].without [2,4] #=> [1,3,1,3]
	#
	# @param [Array] w the elements to remove
	# @return [Enumerable]
	def without(w)
		where {|x| !w.has?(x)}
	end

end