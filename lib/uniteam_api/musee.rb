module UniteamAPI
  class Musee
    include HTTParty

    format :json

    base_uri 'expomusees.orange.com'
    basic_auth ENV['UNITEAM_API_USERNAME'], ENV['UNITEAM_API_PASSWORD']

    def self.recent(count = 3)
      list(3)
    end

    def self.list(count = 10, offset = 0)
      response = get("/api/getSearchResults?type=museum&offset=#{offset}&count=#{count}")
      # debugger
      musees = JSON.parse(response.body)
      total_count = musees["totalCount"]
      offset = musees["offset"]
      count = musees["count"]
      articles = musees["pois"].collect do |item|
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
      { items: articles, total_count: total_count, offset: offset, count: count }
    end

    def self.find(id)
      response = get("/api/getPOIDetails?id=#{id}&type=museum")
      result = JSON.parse(response.body)
      { 
        uniteam_id: result["id"],
        name: result["name"],
        title: result["title"],
        latitude: result["latitude"],
        longtitude: result["longtitude"],
        address: result["address"],
        city: result["city"],
        zip_code: result["zipCode"],
        video: result["video"],
        ticketnet_url: result["ticketnetUrl"],
        wikipedia_url: result["wikipediaUrl"],
        summary: result["summary"],
        opening_hours: result["openingHours"],
        cost: result["cost"],
        rating: result["rating"]
      }
    end
  end
end