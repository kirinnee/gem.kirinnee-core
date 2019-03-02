require 'rspec'
require 'kirinnee_core'

describe 'String' do

	describe "replace_all!" do
		it 'should replace all occurrences of string with target' do
			replaced = "a=>b=>c".replace_all("=>", "-")
			expect(replaced).to eq "a-b-c"
		end
		it "should replace all occurrences of string even if it ends with the search" do
			replaced = "a=>b=>c=>".replace_all("=>", "-")
			expect(replaced).to eq "a-b-c-"
		end

		it "should replace all occurrences of string even if it starts with the search" do
			replaced = "=>a=>b=>c".replace_all "=>", "-"
			expect(replaced).to eq "-a-b-c"
		end

		it 'should  not replace all occurrences of the original string' do
			original = "a=>b=>c=>"
			original.replace_all "=>", "-"
			expect(original).to eq "a=>b=>c=>"
		end
	end

	describe "replace_all!" do
		it 'should replace all occurrences of string with target' do
			replaced = "a=>b=>c".replace_all!("=>", "-")
			expect(replaced).to eq "a-b-c"
		end
		it "should replace all occurrences of string even if it ends with the search" do
			replaced = "a=>b=>c=>".replace_all!("=>", "-")
			expect(replaced).to eq "a-b-c-"
		end

		it "should replace all occurrences of string even if it starts with the search" do
			replaced = "=>a=>b=>c".replace_all! "=>", "-"
			expect(replaced).to eq "-a-b-c"
		end

		it 'should replace all occurrences of the original string' do
			original = "a=>b=>c"
			replaced = original.replace_all! "=>", "-"
			expect(original).to eq "a-b-c"
			expect(replaced).to eq "a-b-c"
		end
	end

	describe "take" do
		it 'should take first x characters' do
			expect("Singapore".take 4).to eq("Sing")
		end

		it 'should take all characters if x exceeds string length' do
			expect("Singapore".take 100).to eq("Singapore")
		end

		it 'should return empty string if x is 0' do
			expect("Singapore".take 0).to eq("")
		end

		it 'should not modify original string' do
			original = "Singapore"
			replaced = original.take(4)
			expect(original).to eq "Singapore"
			expect(replaced).to eq "Sing"
		end
	end

	describe "take!" do
		it 'should take first x characters' do
			expect("Singapore".take! 4).to eq("Sing")
		end

		it 'should take all characters if x exceeds string length' do
			expect("Singapore".take! 100).to eq("Singapore")
		end

		it 'should return empty string if x is 0' do
			expect("Singapore".take! 0).to eq("")
		end

		it 'should modify original string' do
			original = "Singapore"
			replaced = original.take!(4)
			expect(original).to eq "Sing"
			expect(replaced).to eq "Sing"
		end
	end

	describe "skip" do
		it 'should skip the first x characters' do
			expect("Singapore".skip 5).to eq "pore"
		end

		it "should return empty string if x is larger than string length" do
			expect("Singapore".skip 100).to eq ""
			expect("Singapore".skip 9).to eq ""
		end

		it "should return original string if x is 0" do
			expect("Singapore".skip 0).to eq "Singapore"
		end

		it "should not modify the original string" do
			original = "Singapore"
			skipped = original.skip 5
			expect(original).to eq "Singapore"
			expect(skipped).to eq "pore"
		end
	end

	describe "skip!" do
		it 'should skip the first x characters' do
			expect("Singapore".skip! 5).to eq "pore"
		end

		it "should return empty string if x is larger than string length" do
			expect("Singapore".skip! 100).to eq ""
			expect("Singapore".skip! 9).to eq ""
		end

		it "should return original string if x is 0" do
			expect("Singapore".skip! 0).to eq "Singapore"
		end

		it "should modify the original string" do
			original = "Singapore"
			skipped = original.skip! 5
			expect(original).to eq "pore"
			expect(skipped).to eq "pore"
		end
	end

	describe "omit" do
		it 'should omit the last x characters' do
			expect("Singapore".omit 5).to eq "Sing"
		end

		it "should return empty string if x is larger than string length" do
			expect("Singapore".omit 100).to eq ""
			expect("Singapore".omit 9).to eq ""
		end

		it "should return original string if x is 0" do
			expect("Singapore".omit 0).to eq "Singapore"
		end

		it "should not modify the original string" do
			original = "Singapore"
			skipped = original.omit 5
			expect(original).to eq "Singapore"
			expect(skipped).to eq "Sing"
		end
	end

	describe "omit!" do
		it 'should omit the last x characters' do
			expect("Singapore".omit! 5).to eq "Sing"
		end

		it "should return empty string if x is larger than string length" do
			expect("Singapore".omit! 100).to eq ""
			expect("Singapore".omit! 9).to eq ""
		end

		it "should return original string if x is 0" do
			expect("Singapore".omit! 0).to eq "Singapore"
		end

		it "should modify the original string" do
			original = "Singapore"
			skipped = original.omit! 5
			expect(original).to eq "Sing"
			expect(skipped).to eq "Sing"
		end
	end

	describe "back" do
		it 'should take last x characters' do
			expect("Singapore".back 4).to eq "pore"
		end

		it 'should take all characters if x exceeds string length' do
			expect("Singapore".back 100).to eq "Singapore"
		end

		it 'should return empty string if x is 0' do
			expect("Singapore".back 0).to eq ""
		end

		it 'should not modify original string' do
			original = "Singapore"
			replaced = original.back(4)
			expect(original).to eq "Singapore"
			expect(replaced).to eq "pore"
		end
	end

	describe "back!" do
		it 'should take last x characters' do
			expect("Singapore".back! 4).to eq "pore"
		end

		it 'should take all characters if x exceeds string length' do
			expect("Singapore".back! 100).to eq "Singapore"
		end

		it 'should return empty string if x is 0' do
			expect("Singapore".back! 0).to eq ""
		end

		it 'should modify original string' do
			original = "Singapore"
			replaced = original.back!(4)
			expect(original).to eq "pore"
			expect(replaced).to eq "pore"
		end
	end

	describe "remove_char_at" do
		it 'should remove character at index if index is positive' do
			expect("Hey! scent!".remove_char_at 0).to eq "ey! scent!"
			expect("Hey! scent!".remove_char_at 3).to eq "Hey scent!"
		end

		it 'should remove character from the back if index is negative' do
			expect("Hey! scent!".remove_char_at -1).to eq "Hey! scent"
			expect("Hey! scent!".remove_char_at -6).to eq "Hey! cent!"
		end

		it 'should not remove character if the index exceeds string length' do
			expect('Hey! scent!'.remove_char_at 100).to eq "Hey! scent!"
			expect("Hey! scent!".remove_char_at -100).to eq "Hey! scent!"
		end

		it 'should not modify the original string' do
			original = "Hello!"
			removed = original.remove_char_at -1
			expect(original).to eq "Hello!"
			expect(removed).to eq "Hello"
		end

	end

	describe "remove_char_at!" do
		it 'should remove character at index if index is positive' do
			expect("Hey! scent!".remove_char_at! 0).to eq "ey! scent!"
			expect("Hey! scent!".remove_char_at! 3).to eq "Hey scent!"
		end

		it 'should remove character from the back if index is negative' do
			expect("Hey! scent!".remove_char_at! -1).to eq "Hey! scent"
			expect("Hey! scent!".remove_char_at! -6).to eq "Hey! cent!"
		end

		it 'should not remove character if the index exceeds string length' do
			expect('Hey! scent!'.remove_char_at! 100).to eq "Hey! scent!"
			expect("Hey! scent!".remove_char_at! -100).to eq "Hey! scent!"
		end

		it 'should modify the original string' do
			original = "Hello!"
			removed = original.remove_char_at! -1
			expect(original).to eq "Hello"
			expect(removed).to eq "Hello"
		end

	end

	describe "remove" do
		it 'should remove all occurrences of the string' do
			expect("a=>b=>c".remove "=>").to eq "abc"
			expect("a,b,c".remove ",").to eq "abc"
			expect("a,b,c".remove ",c").to eq "a,b"
		end

		it "should not modify the original string" do
			original = "a,b,c"
			removed = original.remove ","
			expect(original).to eq "a,b,c"
			expect(removed).to eq "abc"
		end
	end

	describe "remove!" do
		it 'should remove all occurrences of the string' do
			expect("a=>b=>c".remove! "=>").to eq "abc"
			expect("a,b,c".remove! ",").to eq "abc"
			expect("a,b,c".remove! ",c").to eq "a,b"
		end

		it "should modify the original string" do
			original = "a,b,c"
			removed = original.remove! ","
			expect(original).to eq "abc"
			expect(removed).to eq "abc"
		end
	end

	describe "without" do
		it 'should remove all words in the array from the string' do
			expect("=>a->b=>c->".without %w(=> ->)).to eq "abc"
		end

		it 'should not modify the original string' do
			original = "a,b,c"
			no_more = original.without %w(a b c)
			expect(original).to eq "a,b,c"
			expect(no_more).to eq ",,"
		end
	end

	describe "without!" do
		it 'should remove all words in the array from the string' do
			expect("=>a->b=>c->".without! %w(=> ->)).to eq "abc"
		end

		it 'should modify the original string' do
			original = "a,b,c"
			no_more = original.without! %w(a b c)
			expect(original).to eq ",,"
			expect(no_more).to eq ",,"
		end
	end

	describe "repeat" do
		it "should repeat the string x number of times, where x is absolute-d" do
			expect("Hello ".repeat 3).to eq "Hello Hello Hello "
			expect("Hi ".repeat -3).to eq "Hi Hi Hi "
		end

		it "should return empty string if number x is 0" do
			expect("Sand".repeat 0).to eq ""
		end

		it "should not modify the original string" do
			original = "Sand "
			repeated = original.repeat 2
			expect(original).to eq "Sand "
			expect(repeated).to eq "Sand Sand "
		end
	end

	describe "repeat!" do
		it "should repeat the string x number of times, where x is absolute-d" do
			expect("Hello ".repeat! 3).to eq "Hello Hello Hello "
			expect("Hi ".repeat! -3).to eq "Hi Hi Hi "
		end

		it "should return empty string if number x is 0" do
			expect("Sand".repeat! 0).to eq ""
		end

		it "should not modify the original string" do
			original = "Sand "
			repeated = original.repeat! 2
			expect(original).to eq "Sand Sand "
			expect(repeated).to eq "Sand Sand "
		end
	end

	describe "*" do
		it "should repeat the string x number of times, where x is absolute-d" do
			expect("Hello " * 3).to eq "Hello Hello Hello "
			expect("Hi " * -3).to eq "Hi Hi Hi "
		end

		it "should return empty string if number x is 0" do
			expect("Sand" * 0).to eq ""
		end

		it "should not modify the original string" do
			original = "Sand "
			repeated = original * 2
			expect(original).to eq "Sand "
			expect(repeated).to eq "Sand Sand "
		end
	end
end