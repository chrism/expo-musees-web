module UniteamAPI
  
  class Actualite
    def self.recent
      auth = {:username => ENV['UNITEAM_API_USERNAME'], :password => ENV['UNITEAM_API_PASSWORD']}
      response = HTTParty.get("http://orangemusee.uniteam.fr/api/getActu?count=3", {:basic_auth => auth})
      actualites = JSON.parse(response.body, :quirks_mode => true)
      actualites["news"].collect do |item|
        {
          name: item["name"],
          title: item["title"]
        }
      end
    end
  end
end