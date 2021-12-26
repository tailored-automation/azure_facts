require 'json'
require 'net/http'

# AzureFacts class
class Facter::Util::AzureFacts
  API_VERSION = '2021-02-01'.freeze
  METADATA_SERVICE_URL = "http://169.254.169.254/metadata/instance?api-version=#{API_VERSION}".freeze

  def self.metadata
    uri = URI(METADATA_SERVICE_URL)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri)
    request.add_field('Metadata', 'true')
    begin
      response = http.request(request)

      return {} unless response.is_a?(Net::HTTPSuccess)

      JSON.parse(response.body)
    rescue
      {}
    end
  end
end
