require 'dblista'

user = DBLista::Information.user('ID')

puts DBLista::Helpers.get_avatar(user['id'], user['avatar'], 1024)
