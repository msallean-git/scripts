require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'

puts "============================ Params ================================="
jwt = ""
for i in 0 ... ARGV.length
   jwt = jwt.concat(ARGV[i]).concat("\n")
end
puts "JWT -> #{jwt}"
puts "====================================================================="

uri_str = "https://account-d.docusign.com/oauth/token?grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion="
uri_str = uri_str.concat(jwt)
RestClient.post(uri_str, {accept: :json}){|response, request, result, &block|
	case response.code
	when 200
		puts "200: Valid Response"
		puts response
	else
		repose.return!(&block)
	end
}