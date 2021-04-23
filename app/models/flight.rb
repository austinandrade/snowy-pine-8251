class Flight < ApplicationRecord
  belongs_to :airline
  has_many :flights_passengers
  has_many :passengers, through: :flights_passengers

  def airline_name
    airline.name
  end

  def names_of_passengers
    passengers.pluck(:name)
  end
end
