require 'spec_helper'

describe "Artist pages" do
  subject { page }
  
  describe "index" do
    before(:all) { 10.times { FactoryGirl.create(:artist) } }
    after(:all) {Artist.delete_all}
    
    before(:each) do
      visit artists_path
    end
    
    it { should have_selector('h3', text: "Artists") }
    
    it "should list all artists" do
      Artist.all.each do |artist|
        page.should have_selector('td', text: artist.name)
      end
    end
    
    describe "delete" do
      let(:artist) { FactoryGirl.create(:artist) }

      before do
        visit artists_path
      end

      it { should have_link('Delete', href: artist_path(Artist.first)) }
      it "should be able to delete artist" do
        expect { click_link('Delete') }.to change(Artist, :count).by(-1)
      end
    end
  end
  
  describe "create" do
    let(:submit) { "Create" }
    
    before { visit new_artist_path }
    
    it { should have_selector('h3', text: "New artist") }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Artist, :count)
      end
      
      describe "after submission" do
        before { click_button submit }
        
        it { should have_selector('h3', text: "New artist") }
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
        
        it { should have_selector('h3', text: "Artists") }
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
    
    it { should have_selector('h3', text: "Edit artist") }
     
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
      
      it { should have_selector('h3', text: "Artists") }
      it { should have_selector('div.alert.alert-success') }
    end
  end
end
