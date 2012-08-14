# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
                   
  self.per_page = 15
end
