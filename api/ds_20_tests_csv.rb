require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'
require 'csv'

csv = CSV.read("#{ARGV[0]}")
aid = csv[2].last
jwt = csv[5].last

puts "============================ Params ================================="
puts "API Key -> #{aid}"
puts "JWT -> #{jwt}"
puts "====================================================================="

auth =""
uri_str = "https://account-d.docusign.com/oauth/token?grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion="
uri_str = uri_str.concat(jwt)
RestClient.post(uri_str, {accept: :json}){|response, request, result, &block|
	case response.code
	when 200
		puts "200: Valid Response"
		json_resp = JSON.parse(response)
		#puts json_resp['access_token']
		auth = json_resp['access_token']
		puts auth
	else
		response.return!(&block)
	end
}# headers = {:Authorization => "Bearer #{auth}"}
for i in 0 .. 20
	#puts "https://demo.doucusign.net/restapi/v2/accounts/#{aid}/users"
	RestClient.get("https://demo.docusign.net/restapi/v2/accounts/#{aid}/brands", headers = {accept: :json, :Authorization => "Bearer #{auth}"}){|response, request, result, &block|
		case response.code
		when 200
			#puts "200: Valid Response"
			#puts response
			puts i
			if i == 20
				puts "Test Requests Completed"
			end
		else
			response.return!(&block)
		end
		sleep(1)
}
end
