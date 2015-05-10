require 'rails_helper'

describe Post, type: :model do
  it 'is created with a description' do
    post = described_class.new(description: 'My first post')
    expect(post.description).to eq 'My first post'
  end

  it 'can have many comments' do
    expect(subject).to have_many :comments
  end
end
