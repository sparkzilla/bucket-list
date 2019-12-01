require('pry')
require_relative('../models/sights')
require_relative('../models/cities')
# require_relative('models/country')

Sight.delete_all()
City.delete_all()

city1 = City.new({
  'name' => 'Tokyo'
  })
city1.save()

city2 = City.new({
  'name' => 'Paris'
  })
city2.save()

city3 = City.new({
  'name' => 'Cairo'
  })
city3.save()

city4 = City.new({
  'name' => 'Xian'
  })
city4.save()

sight1 = Sight.new({
  'name' => 'Tokyo Tower',
  'status' => 'visited',
  'city_id' => city1.id
})
sight1.save()

sight2 = Sight.new({
  'name' => 'Eifell Tower',
  'status' => 'visited',
  'city_id' => city2.id
})
sight2.save()

sight3 = Sight.new({
  'name' => 'The Pyramids',
  'status' => 'bucket',
  'city_id' => city3.id
})
sight3.save()

sight4 = Sight.new({
  'name' => 'Terracotta Warriors',
  'status' => 'bucket',
  'city_id' => city4.id
})
sight4.save()







binding.pry
nil
