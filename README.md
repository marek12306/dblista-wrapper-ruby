# DList (kiedyś DBLista) Ruby wrapper [![Gem Version](https://badge.fury.io/rb/dblista.svg)](https://badge.fury.io/rb/dblista)

[Dokumentacja](https://www.rubydoc.info/github/marek12306/dblista-wrapper-ruby)

Gem pozwalający na komunikację i eksperymentowanie z API DListy.

Cechy:

- Implementacja prawie wszystkich dostępnych endpointów w API
- Prosta obsługa
- Obszerna dokumentacja

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
dbl = DList::Stats.new 'DLIST_TOKEN', bot
```

Pobieranie topki botów:

```ruby
top = DList::List::Bot.top
puts top
```

## Licencja

Ten gem jest dostępny na licencji [MIT License](https://opensource.org/licenses/MIT). Rób z tym co chcesz.
