module UniteamAPI  
  class Actualite
    include HTTParty

    format :json

    base_uri 'expomusees.orange.com'
    basic_auth ENV['UNITEAM_API_USERNAME'], ENV['UNITEAM_API_PASSWORD']

    def self.recent(count = 3)
      list(3)
    end

    def self.list(count = 10, offset = 0)
      response = get("/api/getActu?count=#{count}&offset=#{offset}")
      actualites = JSON.parse(response.body)
      total_count = actualites["totalCount"]
      offset = actualites["offset"]
      count = actualites["count"]
      articles = actualites["news"].collect do |item|
        {
          uniteam_id: item["id"],
          name: item["name"],
          title: item["title"]
        }
      end
      { items: articles, total_count: total_count, offset: offset, count: count }
    end

    def self.find(id)
      response = get("/api/getPOIDetails?id=#{id}&type=news")
      actualite = JSON.parse(response.body)
      { uniteam_id: actualite["id"], name: actualite["name"], title: actualite["title"], content: actualite["content"] }
    end
  end
end