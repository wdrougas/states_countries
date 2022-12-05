class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end

  def create
    @country = Country.new(country_params)
    @country.save
    redirect_to action: 'index'
  end

  def fetch_states
    @country = Country.find(params[:country_id])
    @states = @country.states
  end

  private

  def country_params
    params.require(:country).permit(:name, :code, :heroku_id)
  end
end
