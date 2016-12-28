class Genre < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  self.per_page = 15
end
