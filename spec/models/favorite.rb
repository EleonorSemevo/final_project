require 'rails_helper'
RSpec.describe Favorite, type: :model do
  it "is valid with user_id, comment_id" do
    favorite = Favorite.new(user_id: 1, comment_id: 1)
    expect(favorite).to be_valid
  end

  it "is invalid without user_id" do
    favorite = Favorite.new(comment_id: 1)
    favorite.valid?
    expect(favorite.errors[:user_id]).to include("doit être rempli(e)")
  end

  it "is invalid without comment_id" do
    favorite = Favorite.new(user_id: 1 )
    favorite.valid?
    expect(favorite.errors[:comment_id]).to include("doit être rempli(e)")
  end
end
