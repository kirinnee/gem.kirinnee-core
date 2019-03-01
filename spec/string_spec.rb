require 'rspec'
require 'kirinnee_core'

describe 'String' do

	describe "Replace All" do
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

	describe "Replace All !" do
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


end