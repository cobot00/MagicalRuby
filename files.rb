#!/usr/bin/ruby
# coding: utf-8

PARTING_LINE = "-------------------------------"

puts PARTING_LINE
puts Dir.entries(".")

puts PARTING_LINE
Dir.entries(".").each do |file|
  puts file
end

# カレントディレクトリから再帰的にrubyスクリプトを表示する
puts PARTING_LINE
count = 0
Dir.glob("**/*.rb").each do |file|
  puts file
  count += 1
end
puts "[file count = #{count}]"
