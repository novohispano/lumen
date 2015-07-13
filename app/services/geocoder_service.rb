class GeocoderService
  attr_reader :service

  def initialize
    @service = Geocoder
  end

  def coordinates(address)
    results = service.search(address).first

    if results
      location_data = results.data['geometry']['location']
    else
      location_data = {}
    end

    format_coordinates(location_data)
  end

  private

  def format_coordinates(location_data)
    coordinates = {}

    coordinates[:latitude]  = location_data['lat']
    coordinates[:longitude] = location_data['lng']

    coordinates
  end
end
