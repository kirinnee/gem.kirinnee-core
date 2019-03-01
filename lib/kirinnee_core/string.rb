class String


	# Replaces the search string with the target string.
	# Returns a copy, does not modify original string
	#
	# "a=>b=>c".replace_all("=>","-") # => "a-b-c"
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
	# "a=>b=>c".replace_all!("=>","-") # => "a-b-c"
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
	# "Singapore".take! 4 # => "Sing"
	# "Singapore".take! 100 # => "Singapore"
	# "Singapore".take! 0 # => ""
	#
	# @param [Integer] x number of characters to take
	# @return [String]
	def take!(x)
		replace(self[0...x])
	end

	# Skips the first x characters of the string
	# Does not modify the original string
	#
	# "Singapore".skip 5 # => "pore"
	# "Singapore".skip 100 # => ""
	# "Singapore".skip 0 # => "Singapore"
	#
	# @param [Integer] x number of character to skip
	# @return [String]
	def skip(x)
		if x > self.length
			return ""
		end
		self[x..-1]
	end

	# Skips the first x characters of the string
	# Modifies the original string
	#
	# "Singapore".skip! 5 # => "pore"
	# "Singapore".skip! 100 # => ""
	# "Singapore".skip! 0 # => "Singapore"
	#
	# @param [Integer] x number of character to skip
	# @return [String]
	def skip!(x)
		replace(skip x)
	end

	# Omits the last x characters of the string
	# Does not modify the original string
	#
	# "Singapore".omit 5 # => "Sing"
	# "Singapore".omit 100 # => ""
	# "Singapore".omit 0  # => "Singapore"
	#
	# @param [Integer] x the number of characters to omit
	# @return [String]
	def omit(x)
		self[0..-(x + 1)]
	end

	# Omits the last x characters of the string
	# Modifies the original string
	#
	# "Singapore".omit 5 # => "Sing"
	# "Singapore".omit 100 # => ""
	# "Singapore".omit 0  # => "Singapore"
	#
	# @param [Integer] x the number of characters to omit
	# @return [String]
	def omit!(x)
		replace(omit x)
	end

	# Takes the last x characters of the string
	# Does not modify the original string
	#
	# "Singapore".back 4 #=> "pore"
	# "Singapore".back 100 # =>"Singapore"
	# "Singapore".back 0 # => ""
	#
	# @param [Integer] x the number of character to take
	# @return [String]
	def back(x)
		if x > self.length
			return self
		end
		self[self.length - x..-1]
	end

	# Takes the last x characters of the string
	# Modify the original string
	#
	# "Singapore".back! 4 #=> "pore"
	# "Singapore".back! 100 # =>"Singapore"
	# "Singapore".back! 0 # => ""
	#
	# @param [Integer] x the number of character to take
	# @return [String]
	def back!(x)
		replace(back x)
	end

	# Removes the character at the index
	# Does not modify the original string
	#
	# Returns without removing characters if index or negative index
	# exceeds length of string
	#
	# "Hey! scent!".remove_char_at 0 # => "ey! scent!"
	# "Hey! scent!".remove_char_at 3 # => "Hey scent!"
	# "Hey! scent!".remove_char_at -1 # => "Hey! scent"
	# "Hey! scent!".remove_char_at -6 #=> "Hey! cent!"
	# "Hey! scent!".remove_char_at 100 # => "Hey! scent!"
	# "Hey! scent!".remove_char_at -100 # => "Hey! scent!"
	#
	# @param [Integer] x the position to remove. Negative index counts from back
	# @param [String]
	def remove_char_at(x)
		i = x + (x < 0 ? length : 0)
		i < 0 ? self : take(i) + skip(i + 1)
	end

	# Removes the character at the index
	# Modifies the original string
	#
	# Returns without removing characters if index or negative index
	# exceeds length of string
	#
	# "Hey! scent!".remove_char_at! 0 # => "ey! scent!"
	# "Hey! scent!".remove_char_at! 3 # => "Hey scent!"
	# "Hey! scent!".remove_char_at! -1 # => "Hey! scent"
	# "Hey! scent!".remove_char_at! -6 #=> "Hey! cent!"
	# "Hey! scent!".remove_char_at! 100 # => "Hey! scent!"
	# "Hey! scent!".remove_char_at! -100 # => "Hey! scent!"
	#
	# @param [Integer] x the position to remove. Negative index counts from back
	# @param [String]
	def remove_char_at!(x)
		replace remove_char_at x
	end

	# Removes all instance of the word
	# Does not modify the original string
	#
	# "a=>b=>c".remove "=>" # => "abc"
	# "a,b,c".remove "," # => "abc"
	# "a,b,c".remove "a" # => ",b,c"
	#
	# @param [String] search string to remove
	# @return [String]
	def remove(search)
		replace_all(search, "")
	end

	# Removes all instance of the word
	# Modifies the original string
	#
	# "a=>b=>c".remove! "=>" # => "abc"
	# "a,b,c".remove! "," # => "abc"
	# "a,b,c".remove! "a" # => ",b,c"
	#
	# @param [String] search string to remove
	# @return [String]
	def remove!(search)
		replace remove search
	end

	# Remove any instance of the words in the array in order
	# Does not modify the original string
	#
	# "A=>B->C".without ["=>","->"] # => "ABC"
	#
	# @param [Array<String>] unwanted the strings to remove
	# @return [String]
	def without(unwanted)
		unwanted.reduce(self, &:remove)
	end

	# Remove any instance of the words in the array in order
	# Modifies the original string
	#
	# "A=>B->C".without! ["=>","->"] # => "ABC"
	#
	# @param [Array<String>] unwanted the strings to remove
	# @return [String]
	def without!(unwanted)
		replace without unwanted
	end
end