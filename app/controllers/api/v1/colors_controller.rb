class Api::V1::ColorsController < ApplicationController
  def show
    #TODO: hex searching doesn't work because of the "#"
    search = params[:id]
    color_data = search[0] == "#" ? search.to_i(16) : search
    color = Color.find_by(color_data: color_data)

    render json: color
  end
end
