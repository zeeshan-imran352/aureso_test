class Track < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  
  NO_TRACK_SELECTED = 'no track selected'
  NO_TRACK_FOUND = 'no track found'

  def normalize_friendly_id(string)
    super.gsub("-", "_")
  end
end
