class String


	# Replaces the search string with the target string.
	# Returns a copy, does not modify original string
	#
	# "a=>b=>c".place_all("=>","-") # => "a-b-c"
	#
	# @param [string] search the string to search for (to be replaced)
	# @param [string] target the string to replace with
	# @return [string]
	def replace_all (search, target)
		r = self.split(search).join target
		if self.end_with? search
			r += target
		end
		r
	end

	# Replaces the search string with the target string.
	# Modifies original string
	#
	# "a=>b=>c".place_all!("=>","-") # => "a-b-c"
	#
	# @param [string] search the string to search for (to be replaced)
	# @param [string] target the string to replace with
	# @return [string]
	def replace_all!(search, target)
		replace(replace_all(search, target))
	end

	# Takes the first x characters of the string
	# Does not modify original string
	#
	# "Singapore".take 4 # => "Sing"
	# "Singapore".take 100 # => "Singapore"
	# "Singapore".take 0 # => ""
	#
	# @param [Integer] x number of characters to take
	# @return [String]
	def take(x)
		self[0...x]
	end

	# Takes the first x characters of the string
	# Modifies original string
	#
	# "Singapore".take 4 # => "Sing"
	# "Singapore".take 100 # => "Singapore"
	# "Singapore".take 0 # => ""
	#
	# @param [Integer] x number of characters to take
	# @return [String]
	def take!(x)
		replace(self[0...x])
	end

end