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

		it 'should  not replace all occurrences of the original string' do
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

		it 'should not modify original string' do
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

		it "should not modify the original string" do
			original = "Singapore"
			skipped = original.skip! 5
			expect(original).to eq "pore"
			expect(skipped).to eq "pore"
		end
	end
end