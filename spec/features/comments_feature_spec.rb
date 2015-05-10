require 'rails_helper'

feature 'comments' do
  before { Post.create description: 'Fun!' }

  scenario 'posts can have many comments' do
    visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: 'Looks fun!'
    click_button 'Leave Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Looks fun!'
  end
end
