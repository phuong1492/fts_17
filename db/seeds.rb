# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  name = Faker::Name.name
  time = 20
  lesson = Lesson.create!(name: name, time: time)
  30.times do |m|
    content = Faker::Lorem.sentence(2)
    question = lesson.questions.create!(content: content)
    4.times do |k|
      option = question.options.create!(content: Faker::Lorem.sentence(2))
    end
  end
end