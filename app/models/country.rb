class Country < ApplicationRecord

  def get_states
    states = State.select {|s| s.country_id == self.heroku_id}
  end
end
