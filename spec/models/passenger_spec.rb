require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'relationships' do
		it { should have_many(:flights_passengers) }
    it { should have_many(:flights).through(:flights_passengers) }
    it { should have_many(:airlines).through(:flights) }
  end
end
