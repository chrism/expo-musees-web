VCR.configure do |config|
  config.cassette_library_dir  = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('username') { ENV['UNITEAM_API_USERNAME'] }
  config.filter_sensitive_data('password') { ENV['UNITEAM_API_PASSWORD'] }
  config.filter_sensitive_data('email@address.com') { ENV['USERNAME'] }
  config.filter_sensitive_data('password') { ENV['PASSWORD'] }
  config.default_cassette_options = { record: :all }
end