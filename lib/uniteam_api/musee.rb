module UniteamAPI
  class Musee
    require 'rest_client'
    @uniteam_api = RestClient::Resource.new(
      ENV['UNITEAM_API_URL'],
      :user => ENV['UNITEAM_API_USERNAME'],
      :password => ENV['UNITEAM_API_PASSWORD']
    )

    def self.recent(count = 3)
      list(3)
    end

    def self.list(count = 10, offset = 0)
      response = @uniteam_api['getSearchResults'].get(:params => {:type => 'museum', :offset => offset, :count => count})
      parsed_response = JSON.parse(response.body)
      total_count = parsed_response["totalCount"]
      offset = parsed_response["offset"]
      count = parsed_response["count"]
      results = parsed_response["pois"].collect do |item|
        {
          uniteam_id: item["id"],
          name: item["name"],
          image_url: item["imageUrl"],
          latitude: item["latitude"],
          longtitude: item["longtitude"],
          summary: item["shortSummary"],
          address: item["address"],
          city: item["city"],
          zip_code: item["zipCode"],
          rating: item["rating"]
        }
      end
      { items: results, total_count: total_count, offset: offset, count: count }
    end

    def self.find(id)
      response = @uniteam_api['getPOIDetails'].get(:params => {:type => 'museum', :id => id})
      parsed_response = JSON.parse(response.body)
      { 
        uniteam_id: parsed_response["id"],
        name: parsed_response["name"],
        title: parsed_response["title"],
        latitude: parsed_response["latitude"],
        longtitude: parsed_response["longtitude"],
        address: parsed_response["address"],
        city: parsed_response["city"],
        zip_code: parsed_response["zipCode"],
        video: parsed_response["video"],
        ticketnet_url: parsed_response["ticketnetUrl"],
        wikipedia_url: parsed_response["wikipediaUrl"],
        summary: parsed_response["summary"],
        opening_hours: parsed_response["openingHours"],
        cost: parsed_response["cost"],
        rating: parsed_response["rating"]
      }
    end
  end
end