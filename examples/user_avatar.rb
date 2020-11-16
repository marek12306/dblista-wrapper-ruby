require 'dblista'

user = DList::Information.user('ID')

puts DList::Helpers.get_avatar(user['id'], user['avatar'], 1024)
