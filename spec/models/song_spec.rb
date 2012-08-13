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
  before { @song = Song.new(title: "3x5", album: "Room for Squares") }

  subject { @song }
  
  it { should respond_to(:title)}
  it { should respond_to(:album)}
  it { should respond_to(:interpreters)}
  it { should respond_to(:genres)}
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @song.title = " " }
    it { should_not be_valid }
  end
end
