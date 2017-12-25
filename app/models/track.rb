class Track < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def normalize_friendly_id(string)
    super.gsub("-", "_")
  end
end
