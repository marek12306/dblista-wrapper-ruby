# frozen_string_literal: true

require 'json'

module DBLista::User
  # Klient użytkownika - akcje
  module Actions
  # Dodaje bota/serwer do DBListy
  #
  # @param body [Hash] surowe dane do wysłania
  # @param type [Symbol] typ (bot/server)
  # @return [Hash] surowe dane od DBListy
  def add(body, type = 'bot')
    raise DBLista::Error, DBLista::Errors::BODY_HASH unless body.is_a?(Hash)
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless ALLOWED_TYPES.include?(type)

    DBLista._post("/#{type}s", body, @token)
  end

  # Edytuje bota/serwer z DBListy
  #
  # @param body [Hash] surowe dane do wysłania
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def edit(body, type = :bot)
    raise DBLista::Error, DBLista::Errors::BODY_HASH unless body.is_a?(Hash)
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._put("/#{type}s", body, @token)
  end

  # Usuwa bot/serwer od DBListy
  #
  # @param id [Integer] ID
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def delete(id, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._delete("/#{type}s/#{id}", nil, @token)
  end
  end
end
