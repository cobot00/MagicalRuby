#!/usr/bin/ruby
# coding: utf-8

=begin
  Rubyの基本的な文法、構文の確認のための簡単なコード集です。
  命名規則、引数の扱い、配列やループ、ファイルの読み書きなどに触れています。
=end

# 定数は大文字で書き始める(2文字目以降の書式は任意!)
PARTING_LINE = "-------------------------------"
FILE_NAME = "test.txt"

puts "Hello, world!"

# 関数、メソッドは小文字でlower_caseで記述する
def partintg_line
  puts PARTING_LINE
end

# 文字列の基本操作
str = "abc"
str << "xyz"
puts str

puts "x".concat(123.to_s)

puts "helloween vs gamma ray".upcase
puts "METEO to Earth".downcase

puts "a12b5b1".gsub("1","A")

# 日付、時刻
def disp_time(prc)
  puts prc+" -> "+Time.now.strftime("%Y/%m/%d %H:%M:%S")
end

disp_time("start")
disp_time("end  ")

# 型変換
partintg_line
puts 123.to_s
sum = 123 + "456".to_i
puts "123 + 456 = #{sum}"

# 引数の扱い方
partintg_line
puts ARGV.size
puts "ARGV.size = #{ARGV.size}"

if ARGV.size == 0
  puts "No argument"
elsif ARGV.size == 1
  puts "1 argument given"
elsif ARGV.size == 2
  puts "2 arguments given"
else
  puts "many arguments given"
end

for arg in ARGV
  puts arg
end

ARGV.each{|arg|
  puts "arg = #{arg}"
}

ARGV.each_with_index{|arg, i|
  puts "index = #{i}, arg = #{arg}"
}

# 配列の基本的な使用例
numbers = []

10.times do |i|
  numbers << i + 1
end

partintg_line
puts "numbers.size = #{numbers.size}"

numbers.each_with_index{|each, i|
  puts "each(#{i}) = #{each}"
}

puts "[1] = #{numbers.include?(1)}"
puts "[2] = #{numbers.include?(2)}"
puts "[0] = #{numbers.include?(0)}"
puts "[11] = #{numbers.include?(11)}"

# 二次元配列の使用例
two_dimensions = [[1,1], [1,2], [1,3], [2,1]]

partintg_line
puts "[1,1] = #{two_dimensions.include?([1,1])}"
puts "[1,2] = #{two_dimensions.include?([1,2])}"
puts "[0,0] = #{two_dimensions.include?([0,0])}"
puts "[1,4] = #{two_dimensions.include?([1,4])}"

partintg_line
mutables = []
mutables << [1,2,3]
mutables << [11,12,13]
mutables << [21,22,23]
mutables.each_with_index{|each, i|
  puts "#{i} = #{each}"
}

# deep copyの使用例
deep_copied = Marshal.load(Marshal.dump(two_dimensions))
two_dimensions[0] = [0,0]
two_dimensions[1] = [0,1]
two_dimensions << [4,4]

partintg_line
deep_copied.each{|each|
  puts "#{each}"
}

# ファイルIO
partintg_line
File.open(FILE_NAME,"w") do |file|
  numbers.each{|each|
    # 右詰かつゼロ埋めで数値を3桁表記にする
    file.puts "hoge" + "%03d" % each
  }
end

File.open(FILE_NAME,"r") do |file|
  file.each_with_index do |line, i|
    puts "line #{i+1}: #{line}"
  end
end

# CSV
partintg_line

require 'csv'

matrix = [
  ["1-1", "1-2","1-3"],
  ["2-1", "2-2","2-3"],
  ["3-1", "3-2","3-3"]
]

CSV.open("practice.csv", "w") do |csv|
  matrix.each do |row|
    csv << row
  end
end

buf = []
CSV.foreach("practice.csv", "r") do |row|
  buf << row
end

puts "buf.size = #{buf.size}"
p buf

# JSON
partintg_line

require 'json'

values = [{a: 1}, {b: 2}, {c: 3}]
puts values.to_json