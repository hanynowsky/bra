require 'minitest/autorun'
require 'bra'

class BraTest < Minitest::Test
	def test_english_hello
		assert_equal "90F", Bra.computer(83,102,"cm","france")
	end
end

