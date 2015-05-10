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
end
