class Test < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  has_many :questions
end
