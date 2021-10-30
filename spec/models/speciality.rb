require 'rails_helper'
RSpec.describe Speciality, type: :model do
  it "is valid with name" do
    speciality = Speciality.new(name: 'odontologie')
    expect(speciality).to be_valid
  end

  it "is invalid without name" do
    speciality = Speciality.new(name: '')
    speciality.valid?
    expect(speciality.errors[:name]).to include("doit être rempli(e)")
  end
end
