require 'jwt'
require 'OpenSSL'
require 'rest-client'
require 'json'

puts "============================ Params ================================="
puts "base_uri -> #{ARGV[0]}"
puts "client_id -> #{ARGV[1]}"
puts "====================================================================="


puts "https://secure.#{ARGV[0]}.adobesign.com/public/oauth/v2?redirect_uri=https://www.onit.com&response_type=code&client_id=#{ARGV[1]}&scope=user_login:account+agreement_read:account+agreement_write:account+agreement_send:account+library_read:account+library_write:account+workflow_read:account+workflow_write:account+webhook_read:account+webhook_write:account:webhook_retention:account