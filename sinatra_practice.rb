#!/usr/bin/ruby
# encoding: utf-8

require 'sinatra'

get "/" do
  "Hoge"
end

get "/fuga" do
  "Fuga"
end

get "/hoge/:name" do
  puts params[:name]
  "Hoge #{params[:name]}"
end