class CalculationService
  def self.calculate_max_speed car, params
    return Track::NO_TRACK_SELECTED unless params[:track].present?

    track = get_track(params[:track])

    surface_factor_percentage = get_surface_factor(track) #adding surface_factor_percentage for random number
    surface_factor_value = speed_factor_value(car.max_speed, surface_factor_percentage)
    max_speed_on_track = calculate_max_speed_on_track(car.max_speed, surface_factor_value)
    current_time_factor = calculate_max_speed_with_time_factor(car, track)

    accumulated_speed = max_speed_on_track - current_time_factor
    return "#{accumulated_speed.round(2)} km/h"

    rescue ActiveRecord::RecordNotFound
      return Track::NO_TRACK_FOUND
  end 

  def self.get_track track_slug
    track = Track.friendly.find(track_slug)
  end

  def self.calculate_max_speed_on_track max_speed, surface_factor_value
    max_speed_on_track = max_speed - surface_factor_value
  end

  def self.speed_factor_value max_speed, speed_factor
    (max_speed * speed_factor) / 100
  end

  def self.get_surface_factor track
    rand(0..35)
  end

  def self.calculate_max_speed_with_time_factor(car, track)
    current_time = Time.now.in_time_zone(track.timezone)
    if (current_time > time_in_track_timezone('9am')) && (current_time < time_in_track_timezone('6pm'))
      speed_factor = 0
    elsif (current_time > time_in_track_timezone('6pm')) && (current_time < time_in_track_timezone('9:30pm'))
      speed_factor = 8
    elsif (current_time > time_in_track_timezone('9:30pm')) && (current_time < time_in_track_timezone('6am'))
      speed_factor = 15
    elsif (current_time > time_in_track_timezone('6am')) && (current_time < time_in_track_timezone('9am'))
      speed_factor = 8
    else
      speed_factor = 0
    end
    time_of_the_day_value = speed_factor_value(car.max_speed, speed_factor)
  end

  def self.time_in_track_timezone(time)
    (time).in_time_zone(Track.last.timezone)
  end

end