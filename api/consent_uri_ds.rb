require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'

puts "============================ Params ================================="
puts "account type (development/production) -> #{ARGV[0]}"
puts "client_id -> #{ARGV[1]}"
puts "====================================================================="


if ARGV[0] == 'development'
	puts "https://account-d.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation&client_id=#{ARGV[1]}&redirect_uri=https://www.onit.com"
else
	puts "https://account.docusign.com/oauth/auth?response_type=code&scope=signature%20impersonation&client_id=#{ARGV[1]}&redirect_uri=https://www.onit.com"
end