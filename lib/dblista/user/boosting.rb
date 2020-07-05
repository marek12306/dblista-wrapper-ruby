# frozen_string_literal: true

module DBLista::User
  # User client - boosting
  module Boosting
    # Boosts selected bot/server
    #
    # @param id [Integer] entity ID
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def boost(id, type = :bot)
      DBLista._validate_id id
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._post("/#{type}s/#{id}/boost", nil, @token)
      true
    end

    # Removes boost from a selected bot/server
    #
    # @param id [Integer] entity ID
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def delete_boost(id, type = :bot)
      DBLista._validate_id id
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._delete("/#{type}s/#{id}/boost", nil, @token)
      true
    end
  end
end
