require 'rails_helper'
RSpec.describe Pharmacy, type: :model do

  it "is valid with name, area_id" do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    pharmacy =   Pharmacy.new(name: 'CNHU', area_id: area.id, number1: '+22965874152', number2: '+52296587415', googlemap_link: 'https://timenowquest/fff/cnhu',  all_nigth: true)
    pharmacy.valid?
    expect(pharmacy).to be_valid
  end

  it "is invalid without name" do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    pharmacy =   Pharmacy.new(name: '', area_id: area.id, number1: '+22965874152', number2: '+52296587415', googlemap_link: 'https://timenowquest/fff/cnhu',  all_nigth: true)
    pharmacy.valid?
    expect(pharmacy.errors[:name]).to include("doit être rempli(e)")
  end

  it "is invalid without area_id" do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    pharmacy =   Pharmacy.new(name: 'CNHU', number1: '+22965874152', number2: '+52296587415', googlemap_link: 'https://timenowquest/fff/cnhu',  all_nigth: true)
    pharmacy.valid?
    expect(pharmacy.errors[:area_id]).to include("doit être rempli(e)")
  end

  it "is valid without number1, number2, googlemap_link, all_nigth " do
    area = Area.create(name: 'Godomey', town: 'Cotonou')
    pharmacy =   Pharmacy.new(name: 'CNHU', area_id: area.id)
    pharmacy.valid?
    expect(pharmacy).to be_valid
  end

end
