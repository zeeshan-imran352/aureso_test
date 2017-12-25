require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource "Cars" do
  let(:car) { FactoryBot.create(:car) }
  
  get "/api/v1/cars/:id" do
    parameter :id, "Car Slug", required: true
    let(:id) { car.slug }

    example "Get car details" do

      do_request
      expect(status).to eq(200)
      json = JSON.parse(response_body)
      car_json = json['data']['car']
      expect(car_json["car_slug"]).to eq(car.slug)
      expect(car_json["max_speed"]).to eq("#{car.max_speed} km/h")
    end

    example "Car Not Found" do
      do_request(id: 'test-wrond-id')

      expect(status).to eq(404)
      json = JSON.parse(response_body)
      expect(json["message"]).to eq('Car Not Found !!')
    end

  end
end