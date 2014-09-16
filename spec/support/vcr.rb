VCR.configure do |config|
  config.cassette_library_dir  = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  # config.preserve_exact_body_bytes { true }
  config.filter_sensitive_data('username:password') { "#{ENV['UNITEAM_API_USERNAME']}:#{ENV['UNITEAM_API_PASSWORD']}" }
  config.default_cassette_options = { record: :all }
end