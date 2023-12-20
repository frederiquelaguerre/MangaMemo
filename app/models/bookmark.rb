class Bookmark < ApplicationRecord
  belongs_to :manga
  belongs_to :list
end
