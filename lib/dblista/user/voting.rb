# frozen_string_literal: true

module DList::User
  # User client - voting
  module Voting
    # Votes for a selected bot/server
    #
    # @param id [Integer] entity ID
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def vote(id, type = :bot)
      DList._validate_id id
      raise DList::Error, DList::Errors::TYPE_NOT_ALLOWED unless DList::User::Client::ALLOWED_TYPES.include?(type)

      DList._post("/#{type}s/#{id}/vote", nil, @token)
      true
    end
  end
end
