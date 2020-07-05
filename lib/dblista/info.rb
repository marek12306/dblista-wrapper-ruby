# frozen_string_literal: true

require 'open-uri'
require 'json'

module DBLista
  # Bot/server/user detailed information
  #
  # @example Checking DBLista user information
  #   info = DBLista::Information.user 123456789012345678
  #   puts info
  module Information
    # Fetches DBLista bot information
    #
    # @param id [Integer] bot ID
    # @return [Hash] raw data from DBLista
    def self.bot(id)
      DBLista._validate_id id
      DBLista._cache(id.to_s.to_sym) do
        DBLista._get("/bots/#{id}")
      end
    end

    # Fetches DBLista server information
    #
    # @param id [Integer] server ID
    # @return [Hash] raw data from DBLista
    def self.server(id)
      DBLista._validate_id id
      DBLista._cache(id.to_s.to_sym) do
        DBLista._get("/servers/#{id}")
      end
    end

    # Fetches DBLista user information
    #
    # @param id [Integer] user ID
    # @return [Hash] raw data from DBLista
    def self.user(id)
      DBLista._validate_id id
      DBLista._cache(id.to_s.to_sym) do
        DBLista._get("/users/#{id}")
      end
    end
  end
end
