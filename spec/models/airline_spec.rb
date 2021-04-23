require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
    it { should have_many(:flights_passengers).through(:flights) }
    it { should have_many(:passengers).through(:flights_passengers) }
  end
end
