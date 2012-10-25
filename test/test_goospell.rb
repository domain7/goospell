require 'test/unit'
require 'goospell'

class GoospellTest < Test::Unit::TestCase
	def test_returns_hashes_with_array
		corrections = Goospell::spell('teh')
		assert_equal Array, corrections['teh'].class
	end

	def test_returns_spelling_correction
		corrections = Goospell::spell('teh')
		assert corrections['teh'].include?('the')
	end
end
