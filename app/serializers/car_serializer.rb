class CarSerializer < ActiveModel::Serializer
  attributes :data

  def data
    {
      car: car_data
    }
  end

  def car_data
    {
      car_slug: object.slug,
      max_speed: "#{object.max_speed} km/h", 
      max_speed_on_track: object.max_speed_on_track
    }
  end

end
