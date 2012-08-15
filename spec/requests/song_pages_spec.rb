require 'spec_helper'

describe "Song pages" do
  subject { page }

  describe "index" do
    before(:all) { 20.times { FactoryGirl.create(:song) } }
    after(:all) {Song.delete_all}

    before(:each) do
      visit songs_path
    end

    it { should have_selector('h1', text: "Songs") }

    describe "delete" do
      let(:song) { FactoryGirl.create(:song) }

      before do
        visit songs_path
      end

      it { should have_link('Delete', href: song_path(Song.order(:title).first)) }
    end
    
    describe "pagination" do

      it { should have_selector('div.pagination') }

      it "should list each song sorted by title" do
        Song.order(:title).paginate(page: 1).each do |song|
          page.should have_selector('td', text: song.title)
        end
      end
    end
  end

  describe "create" do
    let(:submit) { "Create" }

    before { visit new_song_path }

    it { should have_selector('legend', text: "New song") }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Song, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('legend', text: "New song") }
        it { should have_content('error') }
      end
    end

    describe  "with valid information" do
      before do
        fill_in "Title", with: "Someone Like You"
        fill_in "Album", with: "21"
        fill_in "Rating", with: "5"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Song, :count).by(1)
      end

      describe "after saving a user" do
        before { click_button submit }

        it { should have_selector('h1', text: "Songs") }
        it { should have_selector('div.alert.alert-success') }
      end
    end
  end

  describe "edit" do
    let(:song) { FactoryGirl.create(:song) }
    let(:submit) { "Update" }

    before do
      visit edit_song_path(song)
    end

    it { should have_selector('legend', text: "Edit song") }

    describe "with invalid information" do
      before do
        fill_in "Title", with: " "
        click_button submit
      end

      it { should have_content("error") }
    end 

    describe "with valid information" do
      let(:new_title) { "Back to Black" }
      let(:new_album) { "Back to Black" }

      before do
        fill_in "Title", with: new_title
        fill_in "Album", with: new_album
        click_button submit
      end

      it { should have_selector('h1', text: "Songs") }
      it { should have_selector('div.alert.alert-success') }
    end
  end
end
