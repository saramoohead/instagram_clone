require 'rails_helper'

feature 'likes' do
  before { Post.create description: 'Fun!' }

  scenario 'posts can have many likes' do
    visit '/posts'
    click_link 'Like'
    expect(current_path).to eq '/posts'
    expect(page).to have_content '1 Like'
  end
end
