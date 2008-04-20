#!/usr/bin/env ruby

begin
  require 'rubygems'
rescue LoadError
end

require 'amazing'

interval, screen, statusbar, identifier, property, first, second = ARGV
interval = interval.to_f
awesome = Amazing::Awesome.new

trap("SIGINT") do
  awesome.widget_tell(screen, statusbar, identifier, property, second)
  exit
end

iteration = 0
loop do
  awesome.widget_tell(screen, statusbar, identifier, property, iteration % 2 == 0 ? first : second)
  iteration += 1
  sleep interval
end
