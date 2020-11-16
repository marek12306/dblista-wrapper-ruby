UWAGA: Gem ten nie jest już rozwijany. Nie odpowiadam za żadne błędy wywołane tym gemem.
-------------------------------------
# DList (kiedyś DBLista) Ruby wrapper [![Gem Version](https://badge.fury.io/rb/dblista.svg)](https://badge.fury.io/rb/dblista)

[Dokumentacja](https://www.rubydoc.info/github/marek12306/dblista-wrapper-ruby)

Gem pozwalający na komunikację z API DList.

Pozwala na:

- Automatyczne/ręczne wysyłanie statystyk
- Kontrolowanie kontem użytkownika
- Pobieranie różnych list botów, serwerów oraz ich wyszukiwanie
- Pobieranie informacji o botach, serwerach oraz użytkownikach

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
puts top
```

## Licencja

Ten gem jest dostępny na licencji [MIT License](https://opensource.org/licenses/MIT). Rób z tym co chcesz.
