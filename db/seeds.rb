require('pry')
require_relative('../models/sights')
# require_relative('models/city')
# require_relative('models/country')

Sight.delete_all()

sight1 = Sight.new({
  'name' => 'Tokyo Tower',
  'status' => 'visited'
})
sight1.save()

sight2 = Sight.new({
  'name' => 'Eifell Tower',
  'status' => 'visited'
})
sight2.save()

sight3 = Sight.new({
  'name' => 'The Pyramids',
  'status' => 'bucket'
})
sight3.save()

sight4 = Sight.new({
  'name' => 'Empire State Building',
  'status' => 'visited'
})
sight4.save()

sight5 = Sight.new({
  'name' => 'The Great Wall',
  'status' => 'bucket'
})
sight5.save()


binding.pry
nil
