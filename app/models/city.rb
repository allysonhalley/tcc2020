class City < ApplicationRecord
  belongs_to :state

  def city_and_state
    "#{self.name}-#{self.state.acronym}"
  end

end
