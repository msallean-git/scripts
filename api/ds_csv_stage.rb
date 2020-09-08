require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'
require 'csv'


csv = CSV.read("#{ARGV[0]}")
ik = csv[0].last
uid = csv[1].last
aid = csv[2].last
buri = csv[3].last
private_key = csv[4].last

puts "============================ Params ================================="
puts "Integration Key -> #{ik}"
puts "User ID -> #{uid}"
puts "API Account ID -> #{aid}"
puts "Base URI -> #{buri}"
puts "Private Key -> #{private_key}"
puts "====================================================================="

rsa_private = OpenSSL::PKey::RSA.new(private_key)
rsa_public = rsa_private.public_key
payload = {iss: ik, sub: uid, iat: 1, exp: 2147483647, aud: "account-d.docusign.com", scope: "signature impersonation"}
token = JWT.encode payload, rsa_private, 'RS256'

puts "JWT Token -> #{token}"

decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }

puts decoded_token
uri_str = "https://account-d.docusign.com/oauth/token?grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion="
uri_str = uri_str.concat(token)
RestClient.post(uri_str, {accept: :json}){|response, request, result, &block|
	case response.code
	when 200
		puts "200: Valid Response"
		puts response
		if csv.last.first == "Private Key"
			CSV.open("#{ARGV[0]}", "a+") do |csv|
  			csv << ["JWT", "#{token}"]
  		end
  	end
	else
		response.return!(&block)
	end
}

