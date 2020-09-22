class PagesController < ApplicationController
  def contact; end

  def distributors
    @distributors = Distributor.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @distributors.geocoded.map do |disti|
      {
        lat: disti.latitude,
        lng: disti.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { disti: disti }),
        image_url: helpers.asset_url('marker')
      }
    end
  end

  def home; end
end
