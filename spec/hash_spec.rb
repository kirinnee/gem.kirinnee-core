require "kirinnee_core"

describe "Hash" do
	describe "without_key" do
		it 'should remove all the keys in the given array from the hash' do
			subj = {:a => 1, :b => 2, :c => 3, :d => 4}
			expected = {:c => 3, :d => 4}
			expect(subj.without_key [:a, :b]).to eq expected
		end

		it 'should not mutate original hash' do
			original = {:a => 1, :b => 2, :c => 3, :d => 4}
			without = original.without_key [:a, :b]
			expect(original).to eq({:a => 1, :b => 2, :c => 3, :d => 4})
			expect(without).to eq ({:c => 3, :d => 4})
		end
	end

	describe "without_key!" do
		it 'should remove all the keys in the given array from the hash' do
			subj = {:a => 1, :b => 2, :c => 3, :d => 4}
			expected = {:c => 3, :d => 4}
			expect(subj.without_key! [:a, :b]).to eq expected
		end

		it 'should mutate original hash' do
			original = {:a => 1, :b => 2, :c => 3, :d => 4}
			without = original.without_key! [:a, :b]
			expect(original).to eq({:c => 3, :d => 4})
			expect(without).to eq ({:c => 3, :d => 4})
		end
	end
end