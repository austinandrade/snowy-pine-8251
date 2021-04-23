require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'relationships' do
    it {should belong_to :airline}
    it { should have_many(:flights_passengers) }
    it { should have_many(:passengers).through(:flights_passengers) }
  end
end
