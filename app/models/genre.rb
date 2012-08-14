# == Schema Information
#
# Table name: genres
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Genre < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
                   
  self.per_page = 15
end
