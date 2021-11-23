# frozen_string_literal: true

RSpec.describe Jagram do
  it "has a version number" do
    expect(Jagram::VERSION).not_to be nil
  end

  context "繰り返し処理" do

    describe "#次の条件が成り立つ間" do
      context "i = 0として、i<=5の間は" do
        it "それぞれを文字列にして足すと'012345'になる" do
          i = 0
          結果 = ""
          次の条件が成り立つ間(-> {i <= 5}) {
            結果 += i.を文字に変換
            i += 1
          }
          expect(結果).to eq("012345")
        end
      end
    end

    describe "#のそれぞれの要素に対して" do
      context "配列 = [1,2,3]" do
        it "それぞれを文字列にして足すと'123'になる" do
          配列 = [1,2,3]
          結果 = ""
          配列.のそれぞれの要素に対して do |i|
            結果 += i.を文字に変換
          end
          expect(結果).to eq("123")
        end
      end
    end

    describe "#次を繰り返す" do
      context "i=0でi>=5のときにループを抜ける場合" do
        it "ループを抜けたときはi=5となる" do
          i = 0
          次を繰り返す do
            i += 1
            もし(i >= 5) do
              繰り返しから抜ける
            end
          end
          expect(i).to eq(5)
        end
      end
    end
    describe "#回繰り返す" do
      context "主語が3のとき" do
        it "3回繰り返す" do
          i = 0
          3.回繰り返す do
            i += 1
          end
          expect(i).to eq(3)
        end
      end
    end

    describe "#から" do
      context "1から4繰り返す" do
        it "それぞれを足してくいくと結果は '1234'になる" do
          結果 = ""
          1.から(4, まで繰り返す) do |i|
            結果 += i.を文字に変換
          end
          expect(結果).to eq("1234")
        end
      end

      context "4から1を繰り返す" do
        it "それぞれを足してくいくと結果は '4321'になる" do
          結果 = ""
          4.から(1, まで繰り返す) do |i|
            結果 += i.を文字に変換
          end
          expect(結果).to eq("4321")
        end
      end
    end
  end
end
