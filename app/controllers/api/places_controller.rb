module Api
  class PlacesController < ApplicationController
    def index
      places = Place.all.map do |place|
        {
          name: place.name,
          city: place.city,
          most_recent_donwload_speed: most_recent_donwload_speed(place),
          most_recent_download_unit: most_recent_download_unit(place),
          number_of_measurements: number_of_measurements(place)
        }
      end

      render(json: { places: })
    end

    def most_recent_donwload_speed(place)
      place.internet_speed.order('created_at').last.download_speed
    end

    def most_recent_download_unit(place)
      place.internet_speed.order('created_at').last.download_units
    end

    def number_of_measurements(place)
      place.internet_speed.count
    end
  end
end
