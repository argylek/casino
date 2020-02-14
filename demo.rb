
# h = {
#   name: 'tim',
#   nested: {
#     other:'stuff'
#   }
# }

# h.each do |key,value|
#   if value.class == Hash
#     value.each do |k, v|
#       puts "v #{v}"
#     end
#   end
#   puts "key: #{key} value:#{value}"
# end



names = ['john', 'sally']

user = {username: 'user1', password: 123456}

contacts = [
  {username: 'steve', password: 12312},
  {username: 'kyle', password: 12312}
]

p contacts[0].class
p contacts[0][:username]