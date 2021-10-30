require 'rails_helper'
RSpec.describe Insurance, type: :model do
  it "is valid with name" do
    speciality = Insurance.new(name: 'La GAB SA')
    expect(speciality).to be_valid
  end

  it "is invalid without name" do
    speciality = Insurance.new(name: '')
    speciality.valid?
    expect(speciality.errors[:name]).to include("doit être rempli(e)")
  end
end
