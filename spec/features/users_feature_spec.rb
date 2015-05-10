require 'rails_helper'

feature 'users' do
  context 'when user is not signed in' do
    it 'user sees a sign in and sign up link' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it 'and does not see a sign out link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context 'when user is signed in' do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it 'user sees a sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it 'and does not see a sign in or sign up link' do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
