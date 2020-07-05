# frozen_string_literal: true

require_relative './actions'
require_relative './boosting'
require_relative './rating'
require_relative './voting'
require_relative './notifications'
require_relative './verification'

# User module - client + client modules
module DBLista::User
  # DBLista user client
  #
  # @example Server voting
  #   client = DBLista::User::Client.new "USER_TOKEN"
  #   client.vote(123456789012345678, :server)
  #
  # @example Bot rating
  #   client = DBLista::User::Client.new "USER_TOKEN"
  #   client.rate(123456789012345678, 5, 'Nice bot')
  class Client
    include DBLista::User::Voting
    include DBLista::User::Actions
    include DBLista::User::Boosting
    include DBLista::User::Rating
    include DBLista::User::Notifications
    include DBLista::User::Verification

    # Allowed entity types to use
    ALLOWED_TYPES = %i[bot server].freeze

    attr_accessor :token

    def initialize(token)
      raise DBLista::Error, DBLista::Errors::TOKEN_NOT_PROVIDED unless token

      @token = token

      me
    end

    # Fetches information about current user
    #
    # @return [Hash] raw data from DBLista
    def me
      DBLista._get('/users/me', @token)
    end

    # Fetches current user guilds
    #
    # @return [Hash] raw data from DBLista
    def guilds
      DBLista._get('/users/me/guilds', @token)
    end
  end
end
