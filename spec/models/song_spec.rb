# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  album      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Song do
  before { @song = Song.new(title: "3x5", album: "Room for Squares", rating: 5) }

  subject { @song }
  
  it { should respond_to(:title)}
  it { should respond_to(:album)}
  it { should respond_to(:interpreters)}
  it { should respond_to(:genres)}
  it { should respond_to(:rating)}
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @song.title = " " }
    it { should_not be_valid }
  end
  
  describe "when rating is not present" do
    before { @song.rating = nil }
    it { should_not be_valid }
  end
  
  describe "when rating is not a number" do
    before { @song.rating = "A" }
    it { should_not be_valid }
  end
  
  describe "when rating is lower than one" do
    before { @song.rating = 0 }
    it { should_not be_valid }
  end

  describe "when rating is higher than 5" do
    before { @song.rating = 6 }
    it { should_not be_valid }
  end  
end
