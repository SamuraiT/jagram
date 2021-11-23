# Jagram

jagram（ジャグラム）とは、JApanese proGRAMming Languageの略で、
日本語でかけるプログラミング言語を目指して作ったものです。
日本におけるプログラミングの教育の場などで、使われたらと思い作成しました。

また、rubyのDSLを使って作成しているため、既存のrubyコードと共存できたり、
jagramでロジックがわかるようになったら、rubyに移行するのような使い方ができます。

## Installation

Gemファイルを使っている場合は、gemにjagramを指定

```ruby
gem 'jagram'
```

そして、次を実行

    $ bundle install

あるいは、直接jagramをインストール

    $ gem install jagram


## 使い方・構文

`require 'jagram'`でjagramが使えるようになります。

### 繰り返し構文
#### 〜の間 構文 - whileに相当
```ruby
require 'jagram'

i = 0
次の条件が成り立つ間( -> { i <= 5} ) do
   次を表示する(i) #> 0,1,2,3,4,5
   i += 1
end

i = 0
結果 = ""
次の条件が成り立つ間(-> {i <= 5}) {
  結果 += i.を文字に変換
  i += 1
}
次を表示する(結果) #> 012345
```
#### 単純な繰り返し構文 - loopに相当
```ruby
require 'jagram'
i = 0
次を繰り返す {
   もし(i.は, 0, ならば) do
     繰り返しから抜ける
   end
   次を表示する(i) #> 0,1,2,3,4,5
   i += 1
}

i = 0
次を繰り返す do
    もし(i.は, 0, ならば) do
     繰り返しから抜ける
   end
   次を表示する(i) #> 0,1,2,3,4,5
   i += 1
end
```

#### 〜から〜まで繰り返す構文 - for文に相当
```ruby
require 'jagram'

結果 = ""
1.から(4, まで繰り返す) do |i|
  結果 += i.を文字に変換
end
次を表示(結果) #> 1234

結果 = ""
4.から(1, まで繰り返す) do |i|
  結果 += i.を文字に変換
end
次を表示(結果) #> 4321
```
#### n回繰り返す構文 - times文に相当
```ruby
require 'jagram'
3.回繰り返す do |i|
　次を表示("#{i}回目のこんにちは") #> 1回目のこんにちは, 2回目のこんにちは, 3回目のこんにちは
end
```

#### 配列のそれぞれの要素を繰り返す - each文に相当

```ruby
require 'jagram'
挨拶の配列 = ["こ", "ん", "に", "ち", "は"]
挨拶の配列.のそれぞれの要素に対して do |要素|
  次を表示(要素) #> こ ん に ち は
end
```
### 条件分岐構文

#### 条件が等しいとき
```ruby
require 'jagram'
太郎君の挨拶 = "hello"
英語の挨拶 = "hello"
もし(太郎君の挨拶.は次と等しい(英語の挨拶), ならば) {
  次を表示("太郎君は英語がわかるのかもしれない")
}
もし(太郎君の挨拶 == 英語の挨拶, ならば) {
  次を表示("太郎君は英語がわかるのかもしれない")
}
```

#### 大小を比較する場合

```ruby
## 大きい場合
require 'jagram'
太郎君の体重 = 60
花子さんの体重 = 120

もし(花子さんの体重.は次の値以上(太郎君の体重), ならば) {
  次を表示("花子さんは太郎君よりも#{花子さんの体重 / 太郎君の体重}倍重たい") #> 花子さんは太郎君よりも2.0倍重たい
}

もし(花子さんの体重 >= 太郎君の体重, ならば) {
  次を表示("花子さんは太郎君よりも#{花子さんの体重 / 太郎君の体重}倍重たい") #> 花子さんは太郎君よりも2.0倍重たい
}

もし(花子さんの体重.は次の値より大きい(太郎君の体重), ならば) {
  次を表示("花子さんは太郎君よりも#{花子さんの体重 / 太郎君の体重}倍重たい") #> 花子さんは太郎君よりも2.0倍重たい
}

もし(花子さんの体重 > 太郎君の体重, ならば) {
  次を表示("花子さんは太郎君よりも#{花子さんの体重 / 太郎君の体重}倍重たい") #> 花子さんは太郎君よりも2.0倍重たい
}

## 小さい場合
太郎君の体重 = 60
花子さんの体重 = 120

もし(太郎君の体重.は次の値以下(花子さんの体重), ならば) {
  次を表示("太郎君は花子さんより軽い") #> 太郎君は花子さんより軽い
}

もし(太郎君の体重 <= 花子さんの体重, ならば) {
  次を表示("太郎君は花子さんより軽い") #>  太郎君は花子さんより軽い
}

もし(太郎君の体重.は次の値より小さい(花子さんの体重), ならば) {
  次を表示("太郎君は花子さんより軽い") #> 太郎君は花子さんより軽い
}

もし(太郎君の体重 < 花子さんの体重, ならば) {
  次を表示("太郎君は花子さんより軽い") #>  太郎君は花子さんより軽い
}
```
### 関数の作成構文

```ruby
require 'jagram'
関数 :挨拶する, を定義する, -> (挨拶) {
  次を表示(挨拶)
}

挨拶する("こんにちは") #> こんにちは
挨拶する("hello") #> hello

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

国に応じた挨拶("アメリカ") #> Hello
国に応じた挨拶("日本") #> こんにちは
国に応じた挨拶("ニイハオ") #> ニイハオ
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jagram. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/jagram/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Jagram project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jagram/blob/master/CODE_OF_CONDUCT.md).
