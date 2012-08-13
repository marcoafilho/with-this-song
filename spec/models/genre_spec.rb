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

require 'spec_helper'

describe Genre do
  before { @genre = Genre.new(name: "Pop", description: "Originated in its modern form in the 1950s") }
  
  subject { @genre }
  
  it { should respond_to(:name)}
  it { should respond_to(:description)}
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @genre.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is already taken" do
    before do
      genre_with_same_name = @genre.dup
      genre_with_same_name.name = @genre.name.upcase
      genre_with_same_name.save
    end
    
    it { should_not be_valid }
  end
end
