require 'rails_helper'

RSpec.describe Station, type: :model do
  subject { described_class.new(
    name: "Bahn Station",
    description: "Very nice",
    category: "popup",
    latitude: 11.519817,
    longitude: 12.565449,
    bike_capacity: 20
  ) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without attributes" do
    expect(Station.new).to_not be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without latitude" do
    subject.latitude = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without longitude" do
    subject.longitude = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without category" do
    subject.category = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without bike capacity" do
    subject.bike_capacity = nil
    expect(subject).to_not be_valid
  end

  it "is valid without giving shown attribute" do
    expect(subject).to be_valid
  end

  it "is valid without address" do
    expect(subject).to be_valid
  end
end
