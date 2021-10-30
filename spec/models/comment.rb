require 'rails_helper'
RSpec.describe Comment, type: :model do
  it "is valid with user_id, content" do
    comment = Comment.new(user_id: 1, content: "some content")
    expect(comment).to be_valid
  end

  it "is invalid without user_id" do
    comment = Comment.new(content: "some content")
    comment.valid?
    expect(comment.errors[:user_id]).to include("doit être rempli(e)")
  end

  it "is invalid without content" do
    comment = Comment.new(content: '', user_id: 1 )
    comment.valid?
    expect(comment.errors[:content]).to include("doit être rempli(e)")
  end
end
