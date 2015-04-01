# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |n|
  name = "Lesson #{n+1}"
  time = 20
  lesson = Lesson.create!(name: name, time: time)
  30.times do |m|
    content = "Question #{n+1}-#{m+1}"
    question = lesson.questions.create!(content: content)
    4.times do |k|
      option = question.options.create!(content: "Option #{k+1}")
    end
  end
end