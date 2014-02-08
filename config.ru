#!/usr/bin/ruby
# encoding: utf-8

require 'logger'
require './rack_practice.rb'
require './applog.rb'

logger = ::Logger.new('_app.log')

def logger.write(msg)
  self << msg
end

use AppLog, logger

use Rack::CommonLogger, logger

run RackPractice.new