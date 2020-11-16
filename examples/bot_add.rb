require 'dblista'

client = DList::User::Client.new('TOKEN')

client.add({
  id: 'id',
  info: {
    library: 'NiceBot',
    tags: [
      DList::Tags::Bot::FUN,
      DList::Tags::Bot::TOOLS
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