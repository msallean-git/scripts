require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'

puts "============================ Params ================================="
puts "base_uri -> #{ARGV[0]}"
puts "client_id -> #{ARGV[1]}"
puts "client_secret -> #{ARGV[2]}"
puts "code -> #{ARGV[3]}"
puts "====================================================================="

access_token = ""
refresh_token = ""
uri_str = "https://secure.#{ARGV[0]}.adobesign.com/oauth/v2/token"
payload_str = ""
RestClient.Request.execute(:method => :post, :url => uri_str, :payload => '{“grant_type":"authorization_code","code":"CBNCKBAAHBCAABAAASHJlb2THiBylNom-E7qsvN5qZ9h8g7P","client_id":"CBJCHBCAABAA7STPKahkmRhOX5Vz28EZPCR-RCjC2GDA","client_secret":"y2XSoK0wWqCYYX5K6EAqvwaVgRPmBOfp","redirect_uri":"https://www.onit.com”}'){|response, request, result, &block|
	case response.code
	when 200
		puts "200: Valid Response"
		json_resp = JSON.parse(response)
		puts json_resp['access_token']
		puts json_resp['refresh_token']
	else
		response.return!(&block)
	end
}