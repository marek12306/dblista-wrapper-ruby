# frozen_string_literal: true

require 'json'

module DList::User
  # User client - actions
  module Actions
    # Adds bot/server to DList
    #
    # @param body [Hash] raw body to send
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def add(body, type = 'bot')
      raise DList::Error, DList::Errors::BODY_HASH unless body.is_a?(Hash)
      raise DList::Error, DList::Errors::TYPE_NOT_ALLOWED unless DList::User::Client::ALLOWED_TYPES.include?(type)

      DList._post("/#{type}s", body, @token)
      true
    end

    # Edits bot/server in DList
    #
    # @param body [Hash] raw body to send
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def edit(body, type = :bot)
      raise DList::Error, DList::Errors::BODY_HASH unless body.is_a?(Hash)
      raise DList::Error, DList::Errors::TYPE_NOT_ALLOWED unless DList::User::Client::ALLOWED_TYPES.include?(type)

      DList._put("/#{type}s", body, @token)
      true
    end

    # Deletes bot/server from DList
    #
    # @param id [Integer] entity ID
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def delete(id, type = :bot)
      DList._validate_id id
      raise DList::Error, DList::Errors::TYPE_NOT_ALLOWED unless DList::User::Client::ALLOWED_TYPES.include?(type)

      DList._delete("/#{type}s/#{id}", nil, @token)
      true
    end

    # Manages user (bans or adds premium)
    # Available only for DList staff
    #
    # @param id [Integer] user ID
    # @param banned [Boolean] user ban status
    # @param premium [Integer] days for premium
    # @return [Boolean] true if operation succeded
    def manage_user(id, banned = false, premium = 0)
      DList._post("/users/#{id}/manage", {
                      premium: premium,
                      ban: banned
                    }, @token)
      true
    end

    # Generates token for bot
    #
    # @param id [Integer] bot ID
    # @return [Hash] raw data from DList
    def generate_token(id)
      DList._validate_id id
      DList._get("/bots/stats/#{id}?token=#{@token}")
    end

    # Resets token for bot
    #
    # @param id [Integer] bot ID
    # @return [Hash] raw data from DList
    def reset_token(id)
      DList._validate_id id
      DList._post("/bots/stats/#{id}/reset", nil, @token)
    end
  end
end
