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

	describe "back_while" do
		it 'should take the last element while predicate evauates to true' do
			expect([1, 2, 3, 2, 1, 0].back_while {|x| x < 2}).to eq [1, 0]
			expect(%w(a b c b a).back_while {|x| x != "c"}).to eq %w(b a)
			expect({:a => 1, :b => 2, :c => 3, :d => 4}.back_while {|_, i| i > 2}.to_h).to eq ({:c => 3, :d => 4})
		end

		it "should not mutate the original array" do
			original = [1, 2, 3, 2, 1, 0]
			backed = original.back_while {|x| x < 2}
			expect(original).to eq [1, 2, 3, 2, 1, 0]
			expect(backed).to eq [1, 0]
		end
	end

	describe 'omit' do
		it 'should remove the last x element from the enumerable' do
			expect([1, 2, 3, 4, 5].omit 2).to eq [1, 2, 3]
		end

		it 'should remove all elements if x exceed the size of the enumerable' do
			expect([1, 2, 3, 4, 5].omit 100).to eq []
		end

		it 'should remove no elements if x is 0' do
			expect([1, 2].omit 0).to eq [1, 2]
		end

		it 'should not mutate the original enumerable' do
			original = [1, 2, 3, 4]
			omitted = original.omit 2
			expect(original).to eq [1, 2, 3, 4]
			expect(omitted).to eq [1, 2]
		end

	end

	describe "omit_while" do
		it 'should remove the last element while predicate evaluates to true' do
			expect([1, 2, 3, 2, 1, 0].omit_while {|x| x < 3}).to eq [1, 2, 3]
			expect(%w(a b c b a).omit_while {|x| x != 'c'}).to eq %w(a b c)
			expect({:a => 1, :b => 2, :c => 3, :d => 2, :e => 1}.omit_while {|_, i| i < 3}.to_h).to eq({:a => 1, :b => 2, :c => 3})
		end

		it 'should not mutate the original enumerable' do
			original = [1, 2, 3, 2, 1]
			omitted = original.omit_while {|x| x < 3}
			expect(original).to eq [1, 2, 3, 2, 1]
			expect(omitted).to eq [1, 2, 3]
		end
	end

	describe 'remove' do
		it 'should remove all occurrences of the element within the enumerable' do
			expect([1, 2, 3, 1, 2, 3].remove 3).to eq [1, 2, 1, 2]
			expect(%w(apple pear apple orange).remove "apple").to eq %w(pear orange)
		end

		it 'should not mutate the original enumerable' do
			original = [1, 2, 3, 1, 2, 3]
			removed = original.remove 3
			expect(original).to eq [1, 2, 3, 1, 2, 3]
			expect(removed).to eq [1, 2, 1, 2]
		end
	end

	describe 'has?' do
		it 'should return true if the search element exist in the enumerable' do
			expect([1, 2, 3, 4, 5].has? 1).to be_truthy
			expect(%w(a b c d a).has?('a')).to be_truthy
		end

		it 'should return false if the search element does not exist in the enumerable' do
			expect([1, 2, 3, 4].has? 5).to be_falsey
			expect(%w(a b c d).has? "e").to be_falsey
		end

	end

	describe 'without' do
		it 'should remove all occurrences of each element in the provided array from the target enumerable' do
			expect([1, 2, 3, 4, 1, 2, 3, 4].without [2, 4]).to eq [1, 3, 1, 3]
			expect(%w(a b c d a b c d).without %w(a b)).to eq %w(c d c d)
		end

		it 'should not mutate the original enumerable' do
			original = [1, 2, 3, 4, 1, 2, 3, 4]
			without = original.without [2, 4]
			expect(original).to eq [1, 2, 3, 4, 1, 2, 3, 4]
			expect(without).to eq [1, 3, 1, 3]
		end
	end
end