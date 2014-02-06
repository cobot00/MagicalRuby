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

# yamlの基本操作
require 'yaml'

puts PARTING_LINE
elements = [
  { "name" => "hoge",
    "country" => "fuga",
    "age" => 14,
    "hobby" => ["game", "bycycle", "cooking"]
  }
]
puts YAML.dump(elements)

open("elements.yml", "w") do |file|
  YAML.dump(elements, file)
end

puts PARTING_LINE
loaded = YAML.load_file("elements.yml")
puts loaded

# RailsのMySQL用のDB設定の出力、読み込み
db_config = {
  "development" => 
  { "adapter" => "mysql2",
    "encoding" => "utf8",
    "database" => "develop",
    "pool" => 5,
    "username" => "root",
    "password" => "",
    "host" => "localhost"
  }
}
open("database.yml", "w") do |file|
  YAML.dump(db_config, file)
end

puts PARTING_LINE
database = YAML.load_file("database.yml")
params = [
  "adapter",
  "encoding",
  "database",
  "pool",
  "username",
  "password",
  "host"]
params.each do |param|
  puts "#{param}: #{database["development"][param]}"
end