module UniteamAPI
  class Actualite
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
      response = @uniteam_api['getSearchResults'].get(:params => {:type => 'news', :offset => offset, :count => count})
      parsed_response = JSON.parse(response.body)
      total_count = parsed_response["totalCount"]
      offset = parsed_response["offset"]
      count = parsed_response["count"]
      results = parsed_response["pois"].collect do |item|
        {
          uniteam_id: item["id"],
          name: item["name"],
          title: item["title"],
          date: item["date"],
          image_url: item["imageUrl"]
        }
      end
      { items: results, total_count: total_count, offset: offset, count: count }
    end

    def self.find(id)
      response = @uniteam_api['getPOIDetails'].get(:params => {:type => 'news', :id => id})
      parsed_response = JSON.parse(response.body)
      { 
        uniteam_id: parsed_response["id"],
        name: parsed_response["name"],
        title: parsed_response["title"],
        content: parsed_response["content"]
      }
    end
  end
end