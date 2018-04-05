class Api::V1::PallettesController < ApplicationController
  def index
    pallettes = Pallette.all#.page(1)
    render json: pallettes
  end
end
