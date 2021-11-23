module Jagram::FunctionStatement

  # 関数の定義
  #
  # 「関数」を利用することで、関数を定義して、
  # 後から呼び出して使うことができます。
  #
  # @example 使い方 - 関数の定義・定義した関数の利用の仕方
  #   関数 :挨拶する, を定義する, -> (挨拶) {
  #     次を表示(挨拶)
  #   }
  #
  #   挨拶する("こんにちは") #> こんにちは
  #   挨拶する("hello") #> hello
  #
  # @example 使い方 - 関数の定義・定義した関数の利用の仕方
  #   関数 :国に応じた挨拶, を定義する, -> (国) {
  #     使った挨拶 = ""
  #     もし(国 == "アメリカ", ならば) {
  #       次を表示("Hello")
  #       使った挨拶 = "Hello"
  #     }
  #
  #     もし(国 == "日本", ならば) {
  #       次を表示("こんにちは")
  #       使った挨拶 = "こんにちは"
  #     }
  #
  #     もし(国 == "中国", ならば) {
  #       次を表示("ニイハオ")
  #       使った挨拶 = "ニイハオ"
  #     }
  #     使った挨拶
  #   }
  #
  #   国に応じた挨拶("アメリカ") #> Hello
  #   国に応じた挨拶("日本") #> こんにちは
  #   国に応じた挨拶("ニイハオ") #> ニイハオ
  #
  # @param func_name [String, Symbol] 関数名
  # @param cmd_type [Symbol] 関数の定義名
  # @param block [Proc]
  def 関数(func_name, cmd_type=を定義する,  block)
    raise if cmd_type != :define_jp_function
    send(:define_method, func_name, block)
  end

  # @!visibility private
  def を定義する
    :define_jp_function
  end
end
