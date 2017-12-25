class Api::V1::CarsController < Api::V1::BaseController
  before_filter :get_car

  def show
    render :json => {
      data: {
        car: @car
      }
    }
  end

  private

  def get_car
    @car = Car.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { message: 'Car Not Found !!' }, status: :not_found
  end

end
