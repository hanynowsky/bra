#!/usr/bin/env ruby

# author: Hanine HAMZIOUI BEN MADANI <hanynowsky@gmail.com>
# December 2017
# Module that computes Bra size based on underbust and bust measurements

require 'csv'
module Bra
	@debug = false
	puts `ruby --version` if @debug
	@matrix = Dir.pwd + '/data/BRA-CHART.csv'
	@matrix = 'BRA-CHART.csv' unless File.file?(@matrix)
	@cup = '00A'

	# Convert Centimeters to inches
	def self.cm_to_inch(cms)
		return (cms.to_f / 2.54).round(2)
	end

	# Cup Converter - Correspondance between US,FR and EU
	def self.cup_converter(cup, country)
		@underbust = {
			"50" => {"fr"=>"130", "eu"=>"115"},
			"48" => {"fr"=>"125", "eu"=>"110"},
			"46" => {"fr"=>"120", "eu"=>"105"},
			"44" => {"fr"=>"115", "eu"=>"100"},
			"42" => {"fr"=>"110", "eu"=>"95"},
			"40" => {"fr"=>"105", "eu"=>"90"},
			"38" => {"fr"=>"100", "eu"=>"85"},
			"36" => {"fr"=>"95", "eu"=>"80"},
			"34" => {"fr"=>"90", "eu"=>"75"},
			"32" => {"fr"=>"85", "eu"=>"70"},
			"30" => {"fr"=>"90", "eu"=>"65"},
			"28" => {"fr"=>"75", "eu"=>"60"},
			"26" => {"fr"=>"70", "eu"=>"55"},
			"24" => {"fr"=>"65", "eu"=>"50"}
		}
		country = country.downcase
		ubust = cup.gsub(/[^0-9]/, '').to_i
		cup = cup.gsub(/\d+/, "").squeeze(" ").strip
		fr = @underbust["#{ubust}"]['fr']
		eu = @underbust["#{ubust}"]['eu']
		us = ubust
		cup = 'F' if cup.include?('DDD')
		cup = 'E' if cup =~ /^[D][D]$/
		return "#{fr}#{cup}" if country == 'fr' or country == 'france'
		return "#{eu}#{cup}" if country == 'eu' or country == 'europe'
		return "#{ubust}#{cup}"
	rescue => e
		puts "#{e.message}" if @debug
		return @cup
	end

	# Compute Bra Size
	def self.computer(ubust, bust, unit='inch', country='us')
		if unit == 'cm' 
			ubust = cm_to_inch(ubust.to_f)
			bust = cm_to_inch(bust.to_f)
		end
		bust_idx = 0
		# Spot the bust cell
		CSV.foreach(@matrix, quote_char: '"', col_sep: ';', row_sep: :auto, headers: true) do |row|
			row.each_with_index do |cell, idx|
				bust_min = cell[1].split("-")[0].to_f.round(2)
				bust_max = cell[1].split("-")[1].to_f.round(1)
				if bust.to_f >= bust_min and bust.to_f <= bust_max 
					bust_idx = idx
					puts "#{idx}: #{bust_min} #{bust_max}" if @debug
				end
			end
			puts "\n" if @debug
			break
		end
		# Spot the underbust cell and correspond with bust index
		CSV.foreach(@matrix, quote_char: '"', col_sep: ';', row_sep: :auto, headers: true) do |row|
			ubust_min = row[0].split("-")[0].to_f.round(2)
			ubust_max = row[0].split("-")[1].to_f.round(1)
			if ubust.to_f >= ubust_min and ubust.to_f <= ubust_max
				puts "#{ubust_min} #{ubust_max}" if @debug
				puts row[bust_idx] if @debug
				@cup = row[bust_idx]
			end
		end
		return cup_converter(@cup, country)
	rescue => e
		puts "Error: #{e.message}"
		return @cup
	end
end
