# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Artist do
  before { @artist = Artist.new(name: "Artist") }

  subject { @artist }
  
  it { should respond_to(:name)}
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @artist.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is already taken" do
    before do
      artist_with_same_name = @artist.dup
      artist_with_same_name.name = @artist.name.upcase
      artist_with_same_name.save
    end
    
    it { should_not be_valid }
  end
end
