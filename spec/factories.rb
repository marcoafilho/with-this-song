FactoryGirl.define do
  factory :artist do
    sequence(:name) { |n| "Artist #{n}" }
  end
  
  factory :genre do
    sequence(:name) { |n| "Genre #{n}" }
    description "Description text"
  end
  
  factory :song do
    sequence(:title) { |n| "Song #{n}" }
    album "Album name"
  end
end