require('pry')
require_relative('../models/sights')
require_relative('../models/cities')
require_relative('../models/countries')

Sight.delete_all()
City.delete_all()
Country.delete_all()


country1 = Country.new({
  'name' => 'Japan',
})
country1.save()

country2 = Country.new({
  'name' => 'France',
})
country2.save()

country3 = Country.new({
  'name' => 'Egypt',
})
country3.save()

country4 = Country.new({
  'name' => 'China',
})
country4.save()

country5 = Country.new({
  'name' => 'India',
})
country5.save()


city1 = City.new({
  'name' => 'Tokyo',
   'country_id' => country1.id
  })
city1.save()

city2 = City.new({
  'name' => 'Paris',
  'country_id' => country2.id
  })
city2.save()

city3 = City.new({
  'name' => 'Cairo',
  'country_id' => country3.id
  })
city3.save()

city4 = City.new({
  'name' => 'Xian',
  'country_id' => country4.id
  })
city4.save()

city5 = City.new({
  'name' => 'Versailles',
  'country_id' => country2.id
  })
city5.save()

city6 = City.new({
  'name' => 'Delhi',
  'country_id' => country5.id
  })
city6.save()

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

sight5 = Sight.new({
  'name' => 'Taj Mahal',
  'status' => 'bucket',
  'city_id' => city6.id
})
sight5.save()

sight6 = Sight.new({
  'name' => 'Palace of Versailles',
  'status' => 'bucket',
  'city_id' => city5.id
})
sight6.save()

# binding.pry
# nil
