require 'jwt'
require 'OpenSSL'

puts "============================ Params ================================="
puts "Integration key #{ARVG[0]}"
puts "User ID  #{ARGV[1]}"
puts "Private Key #{ARGV[2]}"
puts "====================================================================="

rsa_private = OpenSSL::PKey::RSA.new(ARGV[2])
rsa_public = rsa_private.public_key
payload = {iss: ARGV[0], sub: ARGV[1], iat: 1, exp: 2147483647, aud: "account-d.docusign.com", scope: "signature impersonation"}
token = JWT.encode payload, rsa_private, 'RS256'

puts token

decoded_token = JWT.decode token, rsa_public, true, { algorithm: 'RS256' }

puts decoded_token
#response =  RestClient.post('https://account-d.docusign.com/oauth/token?', headers: {grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer', assertion: token})
#response = RestClient.post('https://account-d.docusign.com/oauth/token', {grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer', assertion: token})
#response = RestClient::Request.execute(method: :post, url: 'https://account-d.docusign.com/oauth/token', headers: {grant_type: 'urn:ietf:params:oauth:grant-type:jwt-bearer', assertion: token})
#puts response.body
