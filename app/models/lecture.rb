class Lecture < ApplicationRecord
  belongs_to :user
  belongs_to :chapitre
end
