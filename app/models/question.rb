class Question < ActiveRecord::Base
  belongs_to :lesson
  has_many :options, dependent: :destroy
  accepts_nested_attributes_for :options, 
    reject_if: :reject_options, allow_destroy: true

  def reject_options(attributes)
    attributes[:content].blank?
  end
end