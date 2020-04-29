require 'rails_helper'

RSpec.describe Seat, type: :model do
  it 'should test the factory is valid' do
    expect(build :seat).to be_valid
  end

  it 'should validate the presence of the seat_id' do
    seat = build :seat, seat_id: ''
    expect(seat).not_to be_valid
    expect(seat.errors.messages[:seat_id]).to include("can't be blank")
  end

  it 'should validate the presence of the row' do
    seat = build :seat, row: ''
    expect(seat).not_to be_valid
    expect(seat.errors.messages[:row]).to include("can't be blank")
  end

  it 'should validate the presence of the column' do
    seat = build :seat, column: ''
    expect(seat).not_to be_valid
    expect(seat.errors.messages[:column]).to include("can't be blank")
  end
end
