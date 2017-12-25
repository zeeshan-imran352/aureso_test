require 'rails_helper'

RSpec.describe CalculationService do
  let(:track)  { FactoryBot.create(:track) }
  let(:car)    { FactoryBot.create(:car) }
  
  subject { CalculationService }
  
  it "should get track details" do
    
    response = CalculationService.get_track(track.id)

    expect(response).not_to be_nil
    expect(response.id).to eq(track.id)
    expect(response.name).to eq(track.name)
  end

  it "should calculate Surface Factor Value " do
    response = CalculationService.speed_factor_value(200, 20)
    expect(response).to eq 40
  end


  it "should get get_surface_factor between 0 to 35" do
    response = CalculationService.get_surface_factor(track)
    expect(response).to be <= 35
    expect(response).to be >= 0
  end

  it "should calculate_max_speed_on_track" do
    max_speed = 280
    surface_factor_value = 10.1
    response = CalculationService.calculate_max_speed_on_track(max_speed, surface_factor_value)
    expect(response).to eq 269.9
  end

  it "should calculate_max_speed_with_time_factor" do
    params = { track: track.slug }
    response = CalculationService.calculate_max_speed(car, params)
    value = response.split(' ')[0].to_f
    expect(value).to be < car.max_speed
  end

end