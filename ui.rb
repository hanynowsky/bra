require 'sinatra'
require_relative 'lib/bra'

set :port, 4564
set :environment, :production
set :sessions, false
set :bind, '0.0.0.0'

include Bra

get '/' do
	erb :input
end

post '/result' do
	underbust = params[:underbust].to_i
	bust = params[:bust].to_i
	unit = params[:munit] || 'inch'
	country = params[:country] || ''
	result = Bra.computer(underbust, bust, unit, country)
	puts "Data: #{underbust} #{bust} #{unit} #{country}"
	puts "Result is #{result}"
	erb :result, :locals => {'result' => result,'underbust' => underbust, 'bust' => bust , 'unit' => unit, 'country' => country}
end

post '/bra/result' do
	underbust = params[:underbust].to_i
	bust = params[:bust].to_i
	unit = params[:munit] || 'inch'
	country = params[:country] || ''
	result = Bra.computer(underbust, bust, unit, country)
	puts "DAta: #{underbust} #{bust} #{unit} #{country}"
	puts "Result is #{result}"
	erb :result, :locals => {'result' => result,'underbust' => underbust, 'bust' => bust , 'unit' => unit, 'country' => country}
end

