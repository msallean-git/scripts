require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'

puts "============================ Params ================================="
puts "Integration Key -> #{ARGV[0]}"
puts "User ID -> #{ARGV[1]}"
private_key = ""
for i in 6 ... (ARGV.length - 4)
   private_key = private_key.concat(ARGV[i]).concat("\n")
end
private_key = private_key.prepend("-----BEGIN RSA PRIVATE KEY-----\n")
private_key = private_key.concat("-----END RSA PRIVATE KEY-----")
puts "Private Key -> #{private_key}"
puts "====================================================================="

rsa_private = OpenSSL::PKey::RSA.new(private_key)
rsa_public = rsa_private.public_key
payload = {iss: ARGV[0], sub: ARGV[1], iat: 1, exp: 2147483647, aud: "account.docusign.com", scope: "signature impersonation"}
token = JWT.encode payload, rsa_private, 'RS256'

puts token

decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }

puts decoded_token
uri_str = "https://account.docusign.com/oauth/token?grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion="
uri_str = uri_str.concat(token)
RestClient.post(uri_str, {accept: :json}){|response, request, result, &block|
	case response.code
	when 200
		puts "200: Valid Response"
		puts response
	else
		response.return!(&block)
	end
}
