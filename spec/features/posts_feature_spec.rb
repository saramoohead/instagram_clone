require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'when posts have been added' do
    scenario 'they display their description' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'post_description', with: 'My first post'
      click_button 'Create Post'
      expect(page).to have_content 'My first post'
      expect(current_path).to eq '/posts'
    end

    scenario 'and their image' do
      visit '/posts'
      click_link 'Add a post'
      attach_file 'post[image]', 'public/999TadpolesFindNewHome.jpg'
      click_button 'Create Post'
      expect(page).to have_css "img[src*='999TadpolesFindNewHome.jpg']"
      # I tried to use Paperclip Shoulda matchers, but couldn't make it work
    end
  end
end
