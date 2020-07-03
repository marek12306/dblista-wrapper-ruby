# frozen_string_literal: true

# Błędy
module DBLista::Errors
  # Błąd wywoływany kiedy ID jest nie podane
  ID_NEEDED = 'You need to enter ID'
  # Błąd wywoływany kiedy podana strona nie jest liczbą
  PAGE_INTEGER = 'Page must be an integer'
  # Błąd wywoływany kiedy token nie jest podany
  TOKEN_NOT_PROVIDED = 'Token is not provided'
  # Błąd wywoływany kiedy typ nie jest prawdiłowy
  TYPE_NOT_ALLOWED = 'Only bot and server types are allowed'
  # Błąd wywoływany kiedy zapytanie do wyszukiwarki nie jest podane
  QUERY_NOT_PROVIDED = 'Search query is not provided'
  # Błąd wywoływany kiedy body (jakaś treść do wysłąnia do API) nie jest hashem
  BODY_HASH = 'Body must be a hash'
end
