# DBLista

[Dokumentacja](https://www.rubydoc.info/github/marek12306/dblista-wrapper-ruby)

Gem pozwalający na komunikację z API DBListy. Pozwala m.in. na automatyczne wysyłanie statystyk (dla botów napisanych w Discordrb) oraz na CRUD botów oraz serwerów.

## Instalacja

Wystarczy dodać tą linijkę do Gemfile:

```ruby
gem 'dblista'
```

I potem odpalić komendę:

    $ bundle

Albo zainstalować ręcznie poprzez gem:

    $ gem install dblista

## Przykładowe użycie

Automatyczne statystyki:

```ruby
bot = Discordrb::Bot.new token: 'TOKEN'
dbl = DBLista::Stats.new 'DBLISTA_TOKEN', bot
```

Pobieranie topki botów:

```ruby
top = DBLista::List::Bot.top
puts top['data'].inspect
```

## License

Ten gem jest dostępny na licencji [MIT License](https://opensource.org/licenses/MIT). Rób z nim co chcesz.
