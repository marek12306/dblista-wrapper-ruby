require 'dblista'
require 'discordrb'

bot = Discordrb::Bot.new token: 'TOKEN'
dbl = DBLista::Stats.new 'DBLISTA_TOKEN', bot

bot.message(content: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run
