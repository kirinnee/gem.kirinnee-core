class Hash

	# Remove all paris with the key in the supplied array
	# Does not mutate the original hash
	#
	# {:a => 1, :b => 2, :c => 3, :d => 4}.without_key [:a, :b] #=> {:c => 3, :d => 4}
	#
	# @param [Array] keys the keys to remove
	# @return [Hash]
	def without_key(keys)
		select {|k| !keys.has? k}.to_h
	end

	# Remove all paris with the key in the supplied array
	# Mutates the original hash
	#
	# {:a => 1, :b => 2, :c => 3, :d => 4}.without_key [:a, :b] #=> {:c => 3, :d => 4}
	#
	# @param [Array] keys the keys to remove
	# @return [Hash]
	def without_key!(keys)
		select! {|k| !keys.has? k}.to_h
	end

end