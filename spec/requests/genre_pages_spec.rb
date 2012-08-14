require 'spec_helper'

describe "Genre pages" do
  subject { page }

  describe "index" do
    before(:all) { 20.times { FactoryGirl.create(:genre) } }
    after(:all) {Genre.delete_all}

    before(:each) do
      visit genres_path
    end

    it { should have_selector('h1', text: "Genres") }

    describe "delete" do
      let(:genre) { FactoryGirl.create(:genre) }

      before do
        visit genres_path
      end

      it { should have_link('Delete', href: genre_path(Genre.first)) }
    end
    
    describe "pagination" do

      it { should have_selector('div.pagination') }

      it "should list each genre sorted by name" do
        Genre.order(:name).paginate(page: 1).each do |genre|
          page.should have_selector('td', text: genre.name)
        end
      end
    end
  end

  describe "create" do
    let(:submit) { "Create" }

    before { visit new_genre_path }

    it { should have_selector('legend', text: "New genre") }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(Genre, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_selector('legend', text: "New genre") }
        it { should have_content('error') }
      end
    end

    describe  "with valid information" do
      before do
        fill_in "Name", with: "Pop"
        fill_in "Description", with: "A description for some kind of genre."
      end

      it "should create a user" do
        expect { click_button submit }.to change(Genre, :count).by(1)
      end

      describe "after saving a user" do
        before { click_button submit }

        it { should have_selector('h1', text: "Genres") }
        it { should have_selector('div.alert.alert-success') }
      end
    end
  end

  describe "edit" do
    let(:genre) { FactoryGirl.create(:genre) }
    let(:submit) { "Update" }

    before do
      visit edit_genre_path(genre)
    end

    it { should have_selector('legend', text: "Edit genre") }

    describe "with invalid information" do
      before do
        fill_in "Name", with: " "
        click_button submit
      end

      it { should have_content("error") }
    end 

    describe "with valid information" do
      let(:new_name) { "Rock" }
      let(:new_description) { "A new description for another genre." }

      before do
        fill_in "Name", with: new_name
        fill_in "Description", with: new_description
        click_button submit
      end

      it { should have_selector('h1', text: "Genres") }
      it { should have_selector('div.alert.alert-success') }
    end
  end
end
