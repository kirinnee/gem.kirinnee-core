# Kirinnee Core

Personal core library that monkey patches basic types such as string and enumerable with utility method.
How each method is used is list below.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kirinnee_core'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kirinnee_core

## Usage

### Enumerable
Here are the monkey patched methods for enumerable

---
##### where `predicate`
Filters based on predicate passed via block. Variant of `select`, `filter` and `find_all` in ruby.

Does not mutate original enumerable
```ruby
[1,2,3].where {|x| x%2!=0 } # => [1,3]
```

##### where! `predicate`
Filters base on predicate passed via block.
Variant of `select`, `filter`, `find_all` method in ruby

Mutates the original enumerable
```ruby
[1,2,3].where! { |x| x%2!=0 } # => [1,3]
```

##### skip `x`
Skips the first x elements of the enumerable

Does not mutate the original enumerable
```ruby
[1,2,3,4,5].skip 3 #=> [4,5]
{:a=>1, :b=>2, :c=>3, :d=>4, :e=>5}.skip 3 #=> {:d=>4, :e=>5}
```

##### skip_while `predicate`
Skips the elements of the enumerable while the predicate evaluates to true

Does not mutate the original enumerable
```ruby
[1,2,3,2,1,0].skip_while {|x| x < 3} # => [3,2,1,0]
```

##### back `x`
Takes the last x element of the enumerable

Does not mutate the original enumerable
```ruby
[1,2,3,4,5,6].back 3 #=> [4,5,6]
[1,2,3,4,5,6].back 100 #=> [1,2,3,4,5,6]
[1,2,3,4,5,6].back 0 #=> []
```

##### back_while `predicate`
Takes the last x element while predicate evaluates to true

Does not mutate the original enumerable
```ruby
[1,2,3,2,1,0].back_while {|x| x <2} # => [1,0]
```

##### omit `x`
Omits the last x element of the enumerable

Does not mutate the original enumerable
```ruby
[1,2,3,4,5].omit 2 # => [1,2,3]
[1,2,3,4,5].omit 100 #=> []
[1,2,3,4,5].omit 0 # => [1,2,3,4,5]
```

##### omit_while `predicate`
Omits the last element while the predicate evaluates to true
 
Does not mutate the original enumerable
```ruby
[1,2,3,2,1,0].omit_while { |x| x <3} #=> [1,2,3]
```

##### remove `search`
Removes all occurrences of the element within the enumerable

Does not mutate the original enumerable
```ruby
[1,2,3,1,2,3].remove 3 #=> [1,2,1,2]
%w(apple pear apple pear).remove "apple" #=> %w(pear pear)
```

##### has? `search`
Whether the enumerable contains at least 1 element that matches the input
```ruby
[1,2,3,4,5,6,1].has? 1 # true
[1,2,3,4,5,6,1].has? 2 # true
[1,2,3,4,5,6,1].has? 7 # false
```

##### without `array`
Remove all occurrences of each element in provided array from target array

Does not mutate the original enumerable
```ruby
[1,2,3,4,1,2,3,4].without [2,4] #=> [1,3,1,3]
```
##### without_index `indexes`
Remove all occurrences of each element in provided array from target array

Does not mutate the original enumerable
```ruby
[1,2,3,4,1,2,3,4].without [2,4] #=> [1,3,1,3]
```

##### indexes `predicate`
Gets the indexes that matches the predicate

Does not mutate the original enumerable
```ruby
[6,5,4,3,2].indexes {|x| x < 4} # => [3,4]
```

### String
Here are the monkey patched methods for Strings

---
##### replace_all `search`,`tareget`
Replaces the search string with the target string.

Does not mutate original string
```ruby
"a=>b=>c".replace_all("=>","-") # => "a-b-c"
```

##### replace_all! `search`,`tareget`
Replaces the search string with the target string.

Mutates original string
```ruby
"a=>b=>c".replace_all!("=>","-") # => "a-b-c"
```

##### take `x`
Takes the first x characters of the string

Does not mutate original string
```ruby
"Singapore".take 4 # => "Sing"
"Singapore".take 100 # => "Singapore"
"Singapore".take 0 # => ""
```

##### take! `x`
Takes the first x characters of the string

Mutates original string
```ruby
"Singapore".take! 4 # => "Sing"
"Singapore".take! 100 # => "Singapore"
"Singapore".take! 0 # => ""
```

##### skip `x`
Skips the first x characters of the string

Does not mutate the original string
```ruby
"Singapore".skip 5 # => "pore"
"Singapore".skip 100 # => ""
"Singapore".skip 0 # => "Singapore"
```

##### skip! `x`
Skips the first x characters of the string

Mutate the original string
```ruby
"Singapore".skip! 5 # => "pore"
"Singapore".skip! 100 # => ""
"Singapore".skip! 0 # => "Singapore"
```

##### omit `x`
Omits the last x characters of the string

Does not mutate the original string
```ruby
"Singapore".omit 5 # => "Sing"
"Singapore".omit 100 # => ""
"Singapore".omit 0  # => "Singapore"
``` 

##### omit! `x`
Omits the last x characters of the string

Mutates the original string
```ruby
"Singapore".omit! 5 # => "Sing"
"Singapore".omit! 100 # => ""
"Singapore".omit! 0  # => "Singapore"
``` 

##### back `x`
Takes the last x characters of the string

Does not mutate the original string

```ruby
"Singapore".back 4 #=> "pore"
"Singapore".back 100 # =>"Singapore"
"Singapore".back 0 # => ""
```

##### back! `x`
Takes the last x characters of the string

Mutates the original string

```ruby
"Singapore".back! 4 #=> "pore"
"Singapore".back! 100 # =>"Singapore"
"Singapore".back! 0 # => ""
```

##### remove_char_at `x`
Removes the character at the index. 
Returns without removing characters if index or negative index
exceeds length of string

Does not mutate the original string

```ruby
"Hey! scent!".remove_char_at 0 # => "ey! scent!"
"Hey! scent!".remove_char_at 3 # => "Hey scent!"
"Hey! scent!".remove_char_at -1 # => "Hey! scent"
"Hey! scent!".remove_char_at -6 #=> "Hey! cent!"
"Hey! scent!".remove_char_at 100 # => "Hey! scent!"
"Hey! scent!".remove_char_at -100 # => "Hey! scent!"
```

##### remove_char_at! `x`
Removes the character at the index. 
Returns without removing characters if index or negative index
exceeds length of string

Does not mutate the original string

```ruby
"Hey! scent!".remove_char_at! 0 # => "ey! scent!"
"Hey! scent!".remove_char_at! 3 # => "Hey scent!"
"Hey! scent!".remove_char_at! -1 # => "Hey! scent"
"Hey! scent!".remove_char_at! -6 #=> "Hey! cent!"
"Hey! scent!".remove_char_at! 100 # => "Hey! scent!"
"Hey! scent!".remove_char_at! -100 # => "Hey! scent!"
```

##### remove `search`
Removes all instance of the word

Does not mutate the original string

```ruby
"a=>b=>c".remove "=>" # => "abc"
"a,b,c".remove "," # => "abc"
"a,b,c".remove "a" # => ",b,c"
```

##### remove! `search`
Removes all instance of the word

Mutates the original string

```ruby
"a=>b=>c".remove! "=>" # => "abc"
"a,b,c".remove! "," # => "abc"
"a,b,c".remove! "a" # => ",b,c"
```

##### without `unwanted`

Remove any instance of the words in the array in order

Does not mutate the original string
```ruby
"A=>B->C".without ["=>","->"] # => "ABC"
```

##### without! `unwanted`

Remove any instance of the words in the array in order

Mutates the original string
```ruby
"A=>B->C".without ["=>","->"] # => "ABC"
```

##### repeat `x`
Repeats the string x number of times.
Input is absolute-d.

Does not mutates the original string
```ruby
"Hello ".repeat 3 # => "Hello Hello Hello "
"Hello ".repeat -3 # => "Hello Hello Hello "
```


##### repeat! `x`
Repeats the string x number of times.
Input is absolute-d.

Mutates the original string
```ruby
"Hello ".repeat! 3 # => "Hello Hello Hello "
"Hello ".repeat! -3 # => "Hello Hello Hello "
```

##### * `x`
Repeats the string x number of times.
Input is absolute-d.

Does not mutates the original string
```ruby
"Hello " * 3 # => "Hello Hello Hello "
"Hello"  * -3 # => "Hello Hello Hello "
```

##### count_occurrences `search`
Counts the number of times a string appears

```ruby
"Hello".count_occurrences "l" # => 2
"one day one night".count_occurrences "one" # => 2
"one day one night".count_occurrences "day" # => 1
"one day one night".count_occurrences "morning" # => 0
"one day one night one".count_occurrences "one" # => 3
```

---


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.
 You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

To release a new version, please wait for merge request to be accepted.


## Contributing

Bug reports and pull requests are welcome on GitLab at 
[https://gitlab.com/ruby-gem/kirinnee-core](https://gitlab.com/ruby-gem/kirinnee-core). 
This project is intended to be a safe, welcoming space for collaboration, and 
contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) 
code of conduct.        

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of Conduct
Everyone interacting in the KirinneeCore project’s codebases, issue trackers, 
chat rooms and mailing lists is expected to follow the 
[code of conduct](CODE_OF_CONDUCT.md).
