require_relative '../ui.rb'
require 'test/unit'
require 'rack/test'
# gem install rack-test

class MyAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_input
		get '/'
		assert last_response.ok?
		assert last_response.body.include?('Bra')
	end

	def test_result
		post '/bra/result', params={:bust => 102, :underbust => 83, :munit => "cm", :country => 'france'}
		assert last_response.ok?
		assert last_response.body.include?('Bra')
	end
end
