# frozen_string_literal: true

require 'zache'

require_relative './actions'
require_relative './boosting'
require_relative './rating'
require_relative './voting'
require_relative './notifications'
require_relative './verification'
require_relative './info'

# User module - client + client modules
module DList::User
  # DList user client
  #
  # @example Server voting
  #   client = DList::User::Client.new "USER_TOKEN"
  #   client.vote(123456789012345678, :server)
  #
  # @example Bot rating
  #   client = DList::User::Client.new "USER_TOKEN"
  #   client.rate(123456789012345678, 5, 'Nice bot')
  class Client
    include DList::User::Voting
    include DList::User::Actions
    include DList::User::Boosting
    include DList::User::Rating
    include DList::User::Notifications
    include DList::User::Verification
    include DList::User::Information

    # Allowed entity types to use
    ALLOWED_TYPES = %i[bot server].freeze

    attr_accessor :token

    def initialize(token)
      raise DList::Error, DList::Errors::TOKEN_NOT_PROVIDED unless token

      @token = token
      @cache = Zache.new

      me
    end

    # Fetches information about current user
    #
    # @return [Hash] raw data from DList
    def me
      @cache.get(:guilds, lifetime: DList::CACHE_LIFETIME) do
        DList._get('/users/me', @token)
      end
    end

    # Fetches current user guilds
    #
    # @return [Hash] raw data from DList
    def joined_guilds
      @cache.get(:guilds, lifetime: DList::CACHE_LIFETIME) do
        DList._get('/users/me/guilds', @token)
      end
    end
  end
end
