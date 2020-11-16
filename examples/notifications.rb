require 'dblista'

client = DList::User::Client.new('TOKEN')

puts client.notifications
client.clear_notifications
