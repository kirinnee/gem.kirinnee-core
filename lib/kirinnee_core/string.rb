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

end