module UniteamAPI
  class Actualite
    def self.recent
      credentials = "#{ENV['UNITEAM_API_USERNAME']}:#{ENV['UNITEAM_API_PASSWORD']}"
      response = Typhoeus::Request.get('http://orangemusee.uniteam.fr/api/getActu?count=3', userpwd: credentials)
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