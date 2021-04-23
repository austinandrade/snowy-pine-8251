class AirlinesController < ApplicationController
  def show
		@airline = Airline.find(airline_params[:id])
  end

  private

  def airline_params
    params.permit(:id, :name)
  end
end
