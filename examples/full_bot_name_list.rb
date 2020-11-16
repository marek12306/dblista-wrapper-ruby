require 'dblista'

DList::List::Bot.all.each do |server|
  puts server['name']
end