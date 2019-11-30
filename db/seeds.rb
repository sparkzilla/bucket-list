require('pry')
require_relative('../models/users')
require_relative('../models/sights')
require_relative('../models/visits')
# require_relative('models/city')
# require_relative('models/country')

Sight.delete_all()
User.delete_all()
Visit.delete_all()

user1 = User.new({
    'first_name' => "Bob",
    'last_name' => "Andrews"
  })

user1.save()

sight1 = Sight.new({
  'name' => 'Tokyo Tower',
})
sight1.save()

sight2 = Sight.new({
  'name' => 'Eifell Tower',
})
sight2.save()

sight3 = Sight.new({
  'name' => 'The Pyramids',
})
sight3.save()

visit1 = Visit.new({
  'user_id' => user1.id,
  'sight_id' => sight1.id,
  'status' => "visited"
  })
visit1.save()

visit2 = Visit.new({
  'user_id' => user1.id,
  'sight_id' => sight2.id,
  'status' => "bucket"
  })
visit2.save()

visit3 = Visit.new({
  'user_id' => user1.id,
  'sight_id' => sight3.id,
  'status' => "bucket"
  })
visit3.save()



# binding.pry
# nil
