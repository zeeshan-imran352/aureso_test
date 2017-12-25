class Car < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  attr_accessor :max_speed_on_track

  def normalize_friendly_id(string)
    super.gsub("-", "_")
  end
end
