require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'displays posts' do
    scenario 'when user creates one' do
      visit '/posts'
      attach_file('image', 'public/999TadpolesFindNewHome.jpg')
      click_button('Upload')
      expect(attach_file('image', 'public/999TadpolesFindNewHome.jpg')).to be_truthy
    end
  end
end
