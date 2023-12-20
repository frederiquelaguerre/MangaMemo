class Manga < ApplicationRecord
  has_many :chapitres, dependent: :destroy
end
