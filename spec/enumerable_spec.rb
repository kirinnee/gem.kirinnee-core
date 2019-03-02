require 'rspec'
require 'kirinnee_core/enumerable'

describe 'Enumerable' do
	describe "where" do
		it 'should filter base on predicate' do
			expect([1, 2, 3].where {|x| x % 2 != 0}).to eq [1, 3]
		end

		it 'should not modify original enumerable' do
			original = [1, 2, 3]
			filtered = original.where {|x| x % 2 != 0}
			expect(original).to eq [1, 2, 3]
			expect(filtered).to eq [1, 3]
		end
	end

	describe "where!" do
		it 'should filter base on predicate' do
			expect([1, 2, 3].where! {|x| x % 2 != 0}).to eq [1, 3]
		end

		it 'should modify original enumerable' do
			original = [1, 2, 3]
			filtered = original.where! {|x| x % 2 != 0}
			expect(original).to eq [1, 3]
			expect(filtered).to eq [1, 3]
		end
	end
end