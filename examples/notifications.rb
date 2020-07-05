require 'dblista'

client = DBLista::User::Client.new('TOKEN')

puts client.notifications
client.clear_notifications
