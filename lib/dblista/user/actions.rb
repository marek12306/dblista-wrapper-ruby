# frozen_string_literal: true

require 'json'

module DBLista::User
  # User client - actions
  module Actions
    # Adds bot/server to DBLista
    #
    # @param body [Hash] raw body to send
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def add(body, type = 'bot')
      raise DBLista::Error, DBLista::Errors::BODY_HASH unless body.is_a?(Hash)
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._post("/#{type}s", body, @token)
      true
    end

    # Edits bot/server in DBLista
    #
    # @param body [Hash] raw body to send
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def edit(body, type = :bot)
      raise DBLista::Error, DBLista::Errors::BODY_HASH unless body.is_a?(Hash)
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._put("/#{type}s", body, @token)
      true
    end

    # Deletes bot/server from DBLista
    #
    # @param id [Integer] entity ID
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def delete(id, type = :bot)
      DBLista._validate_id id
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._delete("/#{type}s/#{id}", nil, @token)
      true
    end

    # Manages user (bans or adds premium)
    # Available only for DBLista staff
    #
    # @param id [Integer] user ID
    # @param banned [Boolean] user ban status
    # @param premium [Integer] days for premium
    # @return [Boolean] true if operation succeded
    def manage_user(id, banned = false, premium = 0)
      DBLista._post("/users/#{id}/manage", {
                      premium: premium,
                      ban: banned
                    }, @token)
      true
    end
    # Generates token for bot
    #
    # @param id [Integer] bot ID
    # @return [Hash] raw data from DBLista
    def generate_token(id)
      DBLista._validate_id id
      DBLista._get("/bots/stats/#{id}?token=#{@token}")
    end
  end
end
