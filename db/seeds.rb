require 'faker'

City.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all

spacer = "\n" + '░' * 80 + "\n\n"

5.times do
  City.create(city_name: Faker::Address.city)
end
tp City.all
print spacer

100.times do
  Dog.create(dog_name: Faker::Creature::Dog.name,
             city: City.all.sample)
end
tp Dog.all
print spacer

20.times do
  Dogsitter.create(dogsitter_name: Faker::Name.name,
                   city: City.all.sample)
end
tp Dogsitter.all
print spacer

20.times do
  dogsitter = Dogsitter.all.sample
  dog = Dog.where(city: dogsitter.city).sample
  Stroll.create(date: rand(Time.now..Time.now + 1.year),
                dog: dog,
                dogsitter: dogsitter)
end
tp Stroll.all
print spacer
