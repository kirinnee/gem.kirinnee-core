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

	describe "skip" do
		it 'should skip the first x elements' do
			expect([1, 2, 3, 4, 5].skip 3).to eq [4, 5]
			expect({:a => 1, :b => 2, :c => 3, :d => 4, :e => 5}.skip(3).to_h).to eq({:d => 4, :e => 5})
		end

		it "should return empty enumerable if x is larger than enumerable size" do
			expect([1, 2, 3].skip 4).to eq []
			expect({:a => 1, :b => 2, :c => 3}.skip(100).to_h).to eq({})
		end

		it 'should return original enumerable if x is 0' do
			expect([1, 2, 3].skip 0).to eq [1, 2, 3]
			expect({:a => 1, :b => 2, :c => 3}.skip(0).to_h).to eq({:a => 1, :b => 2, :c => 3})
		end

		it "should not modify original enumerable" do
			original = [1, 2, 3, 4, 5]
			skipped = original.skip(2)
			expect(original).to eq [1, 2, 3, 4, 5]
			expect(skipped).to eq([3, 4, 5])
		end

	end

end