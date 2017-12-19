#!/usr/bin/env ruby

require_relative "Bra"
# Caller for Bra module
#
underbust = ARGV[0]
bust = ARGV[1]
unit = ARGV[2]
country = ARGV[3] || 'us'
if ARGV.size < 3
	puts "HELP: ruby bra.rb UNDERBUST BUST UNIT [COUNTRY]" 
	puts "HELP: Example: ruby bra.rb 83 102.6 cm"
	puts "HELP: Example: ruby bra.rb 35.1 41.5 inch"
	puts "HELP: Example: ruby bra.rb 35.1 41.5 inch eu"
	puts "HELP: Example: ruby bra.rb 83 102 inch fr"
else
	include Bra
	puts Bra.computer(underbust, bust, unit, country)
end


