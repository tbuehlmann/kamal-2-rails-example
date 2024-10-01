class PaintingsController < ApplicationController
  def index
    @paintings = Painting.order(id: :desc)
  end

  def create
    @painting = Painting.create!
    redirect_to root_url, notice: "Painting created"
  end
end
