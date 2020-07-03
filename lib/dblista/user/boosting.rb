# frozen_string_literal: true

module DBLista::User
  # Klient użytkownika - boostowanie
  module Boosting
  # Boostuje wybranego bota/serwer
  #
  # @param id [Integer] ID
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def boost(id, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless ALLOWED_TYPES.include?(type)

    DBLista._post("/#{type}s/#{id}/boost", nil, @token)
  end

  # Usuwa boosta od bota/serwera
  #
  # @param id [Integer] ID
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def delete_boost(id, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._delete("/#{type}s/#{id}/boost", nil, @token)
  end
  end
end
