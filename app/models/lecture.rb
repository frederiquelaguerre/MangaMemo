class Lecture < ApplicationRecord
  belongs_to :user
  belongs_to :chapitre

  validates :lu, inclusion: { in: [true, false] }
end
