# frozen_string_literal: true

require 'open-uri'
require 'json'

module DList
  # Bot/server/user detailed information
  #
  # @example Checking DList user information
  #   info = DList::Information.user 123456789012345678
  #   puts info
  module Information
    # Fetches DList bot information
    #
    # @param id [Integer] bot ID
    # @return [Hash] raw data from DList
    def self.bot(id)
      DList._validate_id id
      DList._cache(id.to_s.to_sym) do
        DList._get("/bots/#{id}")
      end
    end

    # Fetches DList server information
    #
    # @param id [Integer] server ID
    # @return [Hash] raw data from DList
    def self.server(id)
      DList._validate_id id
      DList._cache(id.to_s.to_sym) do
        DList._get("/servers/#{id}")
      end
    end

    # Fetches DList user information
    #
    # @param id [Integer] user ID
    # @return [Hash] raw data from DList
    def self.user(id)
      DList._validate_id id
      DList._cache(id.to_s.to_sym) do
        DList._get("/users/#{id}")
      end
    end
  end
end
