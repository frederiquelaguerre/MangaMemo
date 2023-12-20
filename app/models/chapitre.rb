class Chapitre < ApplicationRecord
  belongs_to :manga
  has_many :lectures, dependent: :destroy
  has_many :users, through: :lectures

end
