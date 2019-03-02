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

	describe "skip_while" do
		it 'should skip while predicate evaluates to true' do
			expect([1, 2, 3, 2, 1, 0].skip_while {|x| x < 3}).to eq [3, 2, 1, 0]
			expect(%w(a b a).skip_while {|x| x == 'a'}).to eq %w(b a)
			expect({:a => 1, :b => 2, :c => 1}.skip_while {|_, v| v == 1}.to_h).to eq({:b => 2, :c => 1})
		end

		it 'should not mutate the original enumerable' do
			original = [1, 2, 3, 2, 1, 0]
			skipped = original.skip_while {|x| x < 3}
			expect(original).to eq [1, 2, 3, 2, 1, 0]
			expect(skipped).to eq [3, 2, 1, 0]
		end
	end

	describe 'back' do
		it 'should take the last x elements of the enumerable' do
			expect([1, 2, 3, 4, 5, 6].back 3).to eq [4, 5, 6]
		end

		it 'should take return all elements of enumerable if x exceeds size of enumerable' do
			expect([1, 2, 3, 4, 5, 6].back 100).to eq [1, 2, 3, 4, 5, 6]
		end

		it 'should return an empty enumerable' do
			expect([1, 2, 3, 4, 5, 6].back 0).to eq []
		end

		it 'should not mutate the original array' do
			original = [1, 2, 3, 4]
			backed = original.back 2
			expect(original).to eq [1, 2, 3, 4]
			expect(backed).to eq [3, 4]
		end
	end

end