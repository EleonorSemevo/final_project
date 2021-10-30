require 'rails_helper'
RSpec.describe Area, type: :model do
  it "is valid with name, town" do
    area = Area.new(name: "Area1", town: "some town")
    expect(area).to be_valid
  end

  it "is invalid without name" do
    area = Area.new(town: "some town")
    area.valid?
    expect(area.errors[:name]).to include("doit être rempli(e)")
  end

  it "is invalid without town" do
    area = Area.new(town: '', name: "some name" )
    area.valid?
    expect(area.errors[:town]).to include("doit être rempli(e)")
  end
end
