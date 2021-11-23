module Jagram::LoopStatement
  class LoopStatementBreak < Exception
  end
  # 繰り返し構文 （while 文）
  #
  # @example 使い方- 繰り返し構文の利用例
  #  i = 0
  #  次の条件が成り立つ間( -> { i <= 5} ) do
  #     次を表示する(i) #> 0,1,2,3,4,5
  #     i += 1
  #  end
  #
  #  i = 0
  #  結果 = ""
  #  次の条件が成り立つ間(-> {i <= 5}) {
  #    結果 += i.を文字に変換
  #    i += 1
  #  }
  #  次を表示する(結果) #> 012345
  # expect(結果).to eq("012345")
  # @param cond_func [Proc] 条件
  # @param block [Proc] do..endで挟むブロック
  # @return [nil]
  #
  def 次の条件が成り立つ間(cond_func, &block)
    while cond_func.call
      yield
      次の条件が成り立つ間(cond_func, &block)
    end
  end

  # 繰り返し構文 （Loop 文）
  #
  # @example 使い方- 繰り返し構文の利用例
  #  i = 0
  #  次を繰り返す {
  #     もし(i.は, 0, ならば) do
  #       繰り返しから抜ける
  #     end
  #     次を表示する(i) #> 0,1,2,3,4,5
  #     i += 1
  #  }
  #
  #
  # @example 使い方2- 繰り返し構文の利用例(doとendを使う場合)
  #  i = 0
  #  次を繰り返す do
  #      もし(i.は, 0, ならば) do
  #       繰り返しから抜ける
  #     end
  #     次を表示する(i) #> 0,1,2,3,4,5
  #     i += 1
  #  end
  # @param block [Proc] do..endで挟むブロック
  # @return [nil]
  def 次を繰り返す(&block)
    while true
      block.call
    end
  rescue LoopStatementBreak
  end

  # 繰り返しから抜け出すための制御文
  #
  # 繰り返し構文を使っていて、
  # 繰り返し構文から抜けたいときに利用します。
  #
  # @example 使い方- 繰り返しから抜ける　の利用例
  #  i = 0
  #  次を繰り返す do
  #     もし( i > 5 ) do
  #       繰り返しから抜ける # これを呼び出すことで、iが5よりも大きいときに繰り返しを抜け出す
  #     end
  #     次を表示する(i) #> 0,1,2,3,4,5
  #     i += 1
  #  end
  # @return [nil]
  def 繰り返しから抜ける
    raise LoopStatementBreak
  end

  # @!visibility private
  def まで繰り返す
    :loop_until
  end
  module IntegerMethod
    # 繰り返し構文
    # `n.回繰り返す`とすることで, nの数値に応じた回数を
    # 繰り返すことが可能です。
    #
    # @example 使い方 - 回繰り返すの使い方
    #   3.回繰り返す do
    #     次を表示("こんにちは") #> こんにちは, こんにちは, こんにちは
    #   end
    # @example 使い方 - 回繰り返すの使い方
    #   3.回繰り返す do |i|
    #   　次を表示("#{i}回目のこんにちは") #> 1回目のこんにちは, 2回目のこんにちは, 3回目のこんにちは
    #   end
    # @param [Proc]
    def 回繰り返す(&block)
      for i in 1..self
        yield i
      end
    end

    # 繰り返し構文
    #
    # n.から(m, まで繰り返す) とすることで、nからmまでを繰り返すことが可能です。
    #
    # @example 使い方 - から　を使った繰り返し構文
    #   1.から(3, まで繰り返す) do
    #   　次を表示("こんにちは") #> こんにちは, こんにちは, こんにちは
    #   end
    #
    #   # do |変数名|とすることで数値を取り出すことも可能です
    #   1.から(3, まで繰り返す) do |i|
    #   　次を表示("#{i}回目のこんにちは") #> 1回目のこんにちは, 2回目のこんにちは, 3回目のこんにちは
    #   end
    #
    # @example 使い方 - から　を使った繰り返し構文2
    #   # do |変数名|とすることで数値を取り出すことも可能です
    #   1.から(3, まで繰り返す) do |i|
    #   　次を表示(i) #> 1,2,3
    #   end
    # @example 使い方 - から　を使った繰り返し構文 大きい数字から小さい数値
    #   # do |変数名|とすることで数値を取り出すことも可能です
    #   結果 = ""
    #   1.から(4, まで繰り返す) do |i|
    #     結果 += i.を文字に変換
    #   end
    #   次を表示(結果) #> 1234
    #
    #   結果 = ""
    #   4.から(1, まで繰り返す) do |i|
    #     結果 += i.を文字に変換
    #   end
    #   次を表示(結果) #> 4321
    def から(last, cmd_type=まで繰り返す, &block)
      if last >= self
        for i in self..last
          yield i
        end
      else
        i = self
        while i >= last
          yield i
          i -= 1
        end
      end
    end
  end
end

