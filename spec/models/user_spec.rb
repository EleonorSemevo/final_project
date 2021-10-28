require 'rails_helper'
RSpec.describe User, type: :model do

  it "is valid with name, email, password" do
    user =   FactoryBot.create(:user, name: 'Loren', email: 'damy@gmail.com', password: '123456', password_confirmation: '123456', admin: false)
    user.valid?
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user =   User.new(name: '', email: 'lora@gmail.com', password: '123456' , password_confirmation: '123456', admin: false)
    user.valid?
  expect(user.errors[:name]).to include("doit être rempli(e)")
  end

  it "is invalid without email" do
    user =    User.new(name: 'loren', email: '', password: '123456' , password_confirmation: '123456', admin: false)
    user.valid?
    expect(user.errors[:email]).to include("doit être rempli(e)")
  end

  it "is invalid without password " do
    user =    User.new(name: 'loren', email: 'lora@gmail.com', password: '' , password_confirmation: '123456', admin: false)
    user.valid?
    expect(user.errors[:password]).to include("doit être rempli(e)")
  end

  it "is invalid without password_confirmation " do
    user =   User.new(name: 'loren', email: 'lora@gmail.com', password: '123456' , password_confirmation: '', admin: false)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doit être rempli(e)")
  end

end
