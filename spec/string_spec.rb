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

end