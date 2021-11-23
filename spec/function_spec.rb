
RSpec.describe Jagram do

  describe "#関数" do
    関数 :挨拶する, を定義する, -> (挨拶) {
      次を表示(挨拶)
      挨拶
    }

    関数 :国に応じた挨拶, を定義する, -> (国) {
      使った挨拶 = ""
      もし(国 == "アメリカ", ならば) {
        次を表示("Hello")
        使った挨拶 = "Hello"
      }

      もし(国 == "日本", ならば) {
        次を表示("こんにちは")
        使った挨拶 = "こんにちは"
      }

      もし(国 == "中国", ならば) {
        次を表示("ニイハオ")
        使った挨拶 = "ニイハオ"
      }
      使った挨拶
    }
    it do
      expect(挨拶する("こんにちは")).to eq("こんにちは")
    end

    it do
      expect(国に応じた挨拶("アメリカ")).to eq("Hello")
    end
  end
end