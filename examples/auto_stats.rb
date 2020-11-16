require 'dblista'
require 'discordrb'

bot = Discordrb::Bot.new token: 'TOKEN'
dbl = DList::Stats.new 'DList_TOKEN', bot

bot.message(content: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run
