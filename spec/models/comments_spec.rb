require 'rails_helper'

describe Comment, type: :model do
  it 'is created with content' do
    comment = described_class.new(content: 'Looks fun!')
    expect(comment.content).to eq 'Looks fun!'
  end
end
