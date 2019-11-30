require('pry')
require_relative('models/user')
require_relative('models/sight')
require_relative('models/city')
require_relative('models/country')

#User.delete_all()
user1 = Customer.new(
  {
    'first_name' => "Bob",
    'last_name' => "Andrews"
  }
)
user1.save()

sight1 = Sight.new({
  'name' => 'Tokyo Tower',
  'user_id' => user1.id
})
sight1.save()

city1 = City.new({
  'name' => 'Tokyo',
  'sight_id' => site1.id
  })

country1 = Country.new({
  'name' => 'Japan',
  'sight_id' => city1.id
  })



binding.pry
nil
