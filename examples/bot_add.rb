require 'dblista'

client = DBLista::User::Client.new('TOKEN')

client.add({
  id: 'id',
  info: {
    library: 'NiceBot',
    tags: [
      DBLista::Tags::Bot::FUN,
      DBLista::Tags::Bot::TOOLS
    ],
    prefix: '!',
    fullDescription: 'long description',
    shortDescription: 'summary'
  },
  links: {
    gitRepository: 'http://github.com/example/example',
    website: 'http://example.com',
    discordServer: 'discord server'
  },
  owners: [
    'id 1',
    'id 2'
  ]
})