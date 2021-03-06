# frozen_string_literal: true

require_relative "jagram/version"
require_relative "jagram/loop"
require_relative "jagram/conditional"
require_relative "jagram/function"

class Array
  # 配列のそれぞれの要素を取り出せる繰り返し文
  #
  # @example
  #   挨拶の配列 = ["こ", "ん", "に", "ち", "は"]
  #   挨拶の配列.のそれぞれの要素に対して do |要素|
  #     次を表示(要素) #> こ ん に ち は
  #   end
  # 　数値の配列 = [1,2,3]
  #   数値の配列.のそれぞれの要素に対して do |i|
  #     次を表示(i) #> 1,2,3
  #   end
  #
  # @param [Proc]
  # @return [self]
  def のそれぞれの要素に対して(&block)
    i = 0
    size = self.length
    while size > i
      yield self[i]
      i += 1
    end
    self
  end

  # 配列の長さを返す関数　
  # @example
  #  t = [1,2,3]
  #  t.長さ #> 3
  # @return [Integer] 配列の長さを返す
  def 長さ
    self.length
  end

end


class Object
  include Jagram::LoopStatement
  # @!parse include LoopStatement

  include Jagram::ConditionalStatement
  # @!parse include ConditionalStatement

  include Jagram::FunctionStatement
  # @!parse include FunctionStatement

  # 引数をそのまま標準出力に表示するメソッド
  # 使用例
  #
  # @example 使い方 - 文字列を表示する方法
  #   次を表示("こんにちは") #> こんにちは
  #   朝の挨拶 = "おはよう"
  #   次を表示("朝の挨拶は「#{朝の挨拶}」です") #> 朝の挨拶は「おはよう」です
  #
  # @example 使い方 - 数値を表示する方法
  #   次を表示(1234) #> 1234
  #   お昼の時間 = 12
  #   次を表示(お昼の時間) #> 12
  #
  # @param arg [Object] 標準出力に表示させたいオブジェクト
  # @return [nil] 返り値はない。標準出力に表示するだけ
  def 次を表示(arg)
    puts arg
  end

end

class String
  def を数値に変換
    self.to_i
  end
end

class Integer
  include Jagram::LoopStatement::IntegerMethod
  def を文字に変換
    self.to_s
  end
end

