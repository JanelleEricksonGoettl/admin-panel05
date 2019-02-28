class Cohort < ApplicationRecord
  belongs_to :course
  has_one :instructor, dependent: :destroy
  # has_many :students
end
