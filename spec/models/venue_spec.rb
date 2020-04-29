require 'rails_helper'

RSpec.describe Venue, type: :model do
  it 'should test the factory is valid' do
    expect(build :venue).to be_valid
  end

  it 'should validate the presence of the name' do
    venue = build :venue, name: ''
    expect(venue).not_to be_valid
    expect(venue.errors.messages[:name]).to include("can't be blank")
  end

  it 'should validate the uniqueness of the name' do
    venue = create :venue
    invalid_venue = build :venue, name: venue.name
    expect(invalid_venue).not_to be_valid
  end

  it 'should validate the presence of the layout_row' do
    venue = build :venue, layout_row: ''
    expect(venue).not_to be_valid
    expect(venue.errors.messages[:layout_row]).to include("can't be blank")
  end

  it 'should validate the presence of the layout_column' do
    venue = build :venue, layout_column: ''
    expect(venue).not_to be_valid
    expect(venue.errors.messages[:layout_column]).to include("can't be blank")
  end

  it 'should validate the integer of the layout_row' do
    venue = build :venue, layout_row: 3.5
    expect(venue).not_to be_valid
  end

  it 'should validate the integer of the of the layout_column' do
    venue = build :venue, layout_column: 1.5
    expect(venue).not_to be_valid
  end

  it 'should validate the greater than zero of the layout_row' do
    venue = build :venue, layout_row: 0
    expect(venue).not_to be_valid
  end

  it 'should validate the greater than zero of the of the layout_column' do
    venue = build :venue, layout_column: 0
    expect(venue).not_to be_valid
  end
end
