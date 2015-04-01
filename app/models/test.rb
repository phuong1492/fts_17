class Test < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  before_save :init_answers

  private
  def init_answers
    self.lesson.questions.sample(20).each do |question|
      self.answers.build(question: question)
    end
  end
end