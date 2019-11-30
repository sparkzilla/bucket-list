require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/customer_id')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class UserTest < MiniTest::Test

  def test_can_create_new_user
    details = {
      'first_name' => 'Mark',
      'last_name' => 'Devlin',
    }

    new_user = User.new(details)
    assert_equal('Devlin', new_user.first_name)
  end

end
