module UniteamAPI
  
  class Actualite
    def self.recent(count = 3)
      auth = {:username => ENV['UNITEAM_API_USERNAME'], :password => ENV['UNITEAM_API_PASSWORD']}
      response = HTTParty.get("http://orangemusee.uniteam.fr/api/getActu?count=#{count}", {:basic_auth => auth})
      actualites = JSON.parse(response.body)
      
      total_count = actualites["totalCount"]
      articles = actualites["news"].collect do |item|
        {
          name: item["name"],
          title: item["title"]
        }
      end
      
      { :items => articles, :total_count => total_count }
    end
  end
end