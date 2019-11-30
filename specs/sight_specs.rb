require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/sights')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class SightsTest < MiniTest::Test

  def test_can_create_new_site
    details = {
      'name' => 'Tokyo Tower',
      'user_id' => 1
    }

    new_sight = Sight.new(details)
    assert_equal('Tokyo Tower', new_sight.name)
    assert_equal( 1, new_sight.user_id)
  end

end
