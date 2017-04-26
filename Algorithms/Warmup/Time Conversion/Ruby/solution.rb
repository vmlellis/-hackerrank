#!/bin/ruby
require 'time'

time = gets.strip
puts Time.parse(time).strftime('%H:%M:%S')
