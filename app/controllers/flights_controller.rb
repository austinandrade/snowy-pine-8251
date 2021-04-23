class FlightsController < ApplicationController
  def index
		@flights = Flight.all
  end

  private

  def flight_params
    params.permit(:id, :number, :date, :departure_city, :arrival_city)
  end
end
