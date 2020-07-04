# frozen_string_literal: true

module DBLista::User
  # User client - voting
  module Voting
  # Votes for a selected bot/server
  #
  # @param id [Integer] entity ID
  # @param type [Symbol] type of entity (bot/server)
  # @return [Hash] raw data from DBLista
  def vote(id, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._post("/#{type}s/#{id}/vote", nil, @token)
  end
  end
end
