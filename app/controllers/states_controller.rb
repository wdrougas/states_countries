class StatesController < ApplicationController

  def index
    @states = State.all
    @countries = Country.all
  end

  def create
    @state = State.new(state_params)
    @state.save
    redirect_to action: 'index'
  end

  private

  def state_params
    params.require(:state).permit(:name, :code, :country_id)
  end
end
