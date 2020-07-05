require 'dblista'

DBLista::List::Bot.all.each do |server|
  puts server['name']
end