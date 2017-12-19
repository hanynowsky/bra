require 'sinatra'
require_relative 'Bra'

set :port, 4564
set :environment, :production
set :sessions, false
set :bind, '0.0.0.0'

include Bra

get '/' do
	erb :input
end

post '/result/' do
	#return 'Welcome Hanynowsky'
	underbust = params[:underbust].to_i
	bust = params[:bust].to_i
	unit = params[:munit] || 'inch'
	country = params[:country] || ''
	result = Bra.computer(underbust, bust, unit, country)
	puts "DAta: #{underbust} #{bust} #{unit} #{country}"
	puts "Result is #{result}"
	erb :result, :locals => {'result' => result,'underbust' => underbust, 'bust' => bust , 'unit' => unit, 'country' => country}
	#return  result
end

get '/hello/' do
	erb :hello
end

post '/hello/' do
	greeting = params[:greeting] || "Hi There"
	name = params[:name] || "Nobody"

	erb :index, :locals => {'greeting' => greeting, 'name' => name}
end
