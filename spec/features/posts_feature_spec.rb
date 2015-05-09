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
    # post = Post.new
    scenario 'when user creates one' do
      visit '/posts'
      click_link 'Add a post'
      visit '/posts/new'
      attach_file('post[image]', 'public/999TadpolesFindNewHome.jpg')
      click_button 'Create Post'
      # expect(post).to have_attached_file 'public/999TadpolesFindNewHome.jpg'
      expect(page).to have_css "img[src*='999TadpolesFindNewHome.jpg']"
      # I wanted to use Paperclip Shoulda matchers, but couldn't make it work
    end
  end
end
