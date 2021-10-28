require 'rails_helper'
RSpec.describe BloodBank, type: :model do

  it "is valid with name, area_id" do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    blood_bank =   BloodBank.new(name: 'CNHU', area_id: area.id, number1: '+22965874152', number2: '+52296587415', googlemap_link: 'https://timenowquest/fff/cnhu')
    blood_bank.valid?
    expect(blood_bank).to be_valid
  end

  it "is invalid without name" do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    blood_bank =   BloodBank.new(name: '', area_id: area.id, number1: '+22965874152', number2: '+52296587415', googlemap_link: 'https://timenowquest/fff/cnhu')
    blood_bank.valid?
    expect(blood_bank.errors[:name]).to include("doit être rempli(e)")
  end

  it "is invalid without area_id" do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    blood_bank =   BloodBank.new(name: 'CNHU', number1: '+22965874152', number2: '+52296587415', googlemap_link: 'https://timenowquest/fff/cnhu')
    blood_bank.valid?
    expect(blood_bank.errors[:area_id]).to include("doit être rempli(e)")
  end

  it "is valid without number1, number2, googlemap_link, all_nigth " do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    blood_bank =   BloodBank.new(name: 'CNHU', area_id: area.id)
    blood_bank.valid?
    expect(blood_bank).to be_valid
  end

end
