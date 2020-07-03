# frozen_string_literal: true

module DBLista::User
  # Klient użytkownika - głosowanie
  module Rating
  # Wysyła opinię dla wybranego bota/serwer
  #
  # @param id [Integer] ID
  # @param rating [Integer] ocena od 1 do 5
  # @param details [String] szczegóły (opis)
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def rate(id, rating, details, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless ALLOWED_TYPES.include?(type)

    DBLista._post("/#{type}s/#{id}/rate", {
                    rating: rating,
                    details: details
                  }, @token)
  end

  # Usuwa opinię od wybranego bota/serwera
  #
  # @param id [Integer] ID
  # @param target_id [Integer] ID użytkownika od kogo opinia ma zostać usunięta
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def delete_rate(id, target_id = nil, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._delete("/#{type}s/#{id}/rate/#{target_id}", nil, @token)
  end
  end
end
