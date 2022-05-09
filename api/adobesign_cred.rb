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
RestClient.post(uri_str, {:grant_type => "authorization_code",:code => "#{ARGV[3]}",:client_id => "#{ARGV[1]}",:client_secret => "#{ARGV[2]}",:redirect_uri => "https://www.onit.com"},{content_type: :json, accept: :json}){|response, request, result, &block|
	case response.code
	when 200
		puts "200: Valid Response"
		json_resp = JSON.parse(response)
		puts "access_token -> #{json_resp['access_token']}"
		puts "refresh_token -> #{json_resp['refresh_token']}"
	else
		puts response 
		response.return!(&block)
	end
}