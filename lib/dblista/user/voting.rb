# frozen_string_literal: true

module DBLista::User
  # Klient użytkownika - głosowanie
  module Voting
  # Głosuje na wybranego bota/serwer
  #
  # @param id [Integer] ID
  # @param type [Symbol] typ (bot/serwer)
  # @return [Hash] surowe dane od DBListy
  def vote(id, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._post("/#{type}s/#{id}/vote", nil, @token)
  end
  end
end
