RSpec.describe Binding::Expand do
	describe "#expand" do
		using Binding::Expand

		context "引数と同名の変数がある場合" do
			it do
				hoge = 42
				foo = "homu"
				bar = [1, 2, 3]
				expect(binding.expand(:hoge, :foo, :bar)).to eq({ hoge: hoge, foo: foo, bar: bar })
				expect(binding.expand(:hoge, :foo, :bar).keys).to eq([:hoge, :foo, :bar])
			end
		end

		context "引数がない場合" do
			it do
				hoge = 42
				foo = "homu"
				aa  = 1
				bar = [1, 2, 3]
				expect(binding.expand).to eq({ hoge: hoge, foo: foo, aa: aa, bar: bar })
				expect(binding.expand.keys).to eq([:hoge, :foo, :aa, :bar])
			end
		end

		context "引数が String の場合" do
			it do
				hoge = 42
				foo = "homu"
				bar = [1, 2, 3]
				expect(binding.expand("hoge", "foo", "bar")).to eq({ "hoge" => hoge, "foo" => foo, "bar" => bar })
			end
		end

		context "引数と同名の変数がない場合" do
			it { expect { binding.expand(:hoge).to raise_error(NameError) } }
		end

		context "外のスコープの変数を参照しようとした場合" do
			hoge = 42
			it { expect { binding.expand(:hoge).to raise_error(NameError) } }
		end

		context "メソッド名を参照しようとした場合" do
			let(:hoge) { 42 }
			it { expect(binding.expand(:hoge)).to eq({ hoge: hoge }) }
		end
	end
end
