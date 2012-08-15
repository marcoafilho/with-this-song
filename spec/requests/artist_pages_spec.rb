require 'spec_helper'

describe "Artist pages" do
  subject { page }
  
  describe "index" do
    before(:all) { 31.times { FactoryGirl.create(:artist) } }
    after(:all) {Artist.delete_all}
    
    before(:each) do
      visit artists_path
    end
    
    it { should have_selector('h1', text: "Artists") }
    
    describe "delete" do
      let(:artist) { FactoryGirl.create(:artist) }

      before do
        visit artists_path
      end

      it { should have_link('Delete', href: artist_path(Artist.order(:name).first)) }
    end
    
    describe "pagination" do

      it { should have_selector('div.pagination') }

      it "should list each artist ordered by name" do
        Artist.order(:name).paginate(page: 1).each do |artist|
          page.should have_selector('td', text: artist.name)
        end
      end
    end
  end
  
  describe "create" do
    let(:submit) { "Create" }
    
    before { visit new_artist_path }
    
    it { should have_selector('legend', text: "New artist") }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Artist, :count)
      end
      
      describe "after submission" do
        before { click_button submit }
        
        it { should have_selector('legend', text: "New artist") }
        it { should have_content('error') }
      end
    end
    
    describe  "with valid information" do
      before do
        fill_in "Name", with: "Adele"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(Artist, :count).by(1)
      end
      
      describe "after saving a user" do
        before { click_button submit }
        
        it { should have_selector('h1', text: "Artists") }
        it { should have_selector('div.alert.alert-success') }
      end
    end
  end
  
  describe "edit" do
    let(:artist) { FactoryGirl.create(:artist) }
    let(:submit) { "Update" }
    
    before do
      visit edit_artist_path(artist)
    end
    
    it { should have_selector('legend', text: "Edit artist") }
     
    describe "with invalid information" do
      before do
        fill_in "Name", with: " "
        click_button submit
      end
      
      it { should have_content("error") }
    end 
    
    describe "with valid information" do
      let(:new_name) { "Amy Whinehouse" }
      
      before do
        fill_in "Name", with: new_name
        click_button submit
      end
      
      it { should have_selector('h1', text: "Artists") }
      it { should have_selector('div.alert.alert-success') }
    end
  end
end
