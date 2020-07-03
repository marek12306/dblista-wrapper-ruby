# frozen_string_literal: true

require_relative './actions'
require_relative './boosting'
require_relative './rating'
require_relative './voting'

# Moduł usera - klient + moduły klienta
module DBLista::User
  # Klient użytkownika DBListy
  #
  # @example Głosowanie na serwer
  #   client = DBLista::User::Client.new "USER_TOKEN"
  #   response = client.vote(123456789012345678, :server)
  #
  # @example Ocena bota
  #   client = DBLista::User::Client.new "USER_TOKEN"
  #   response = client.rate(123456789012345678, 5, 'Nice bot')
  class Client
    include DBLista::User::Voting
    include DBLista::User::Actions
    include DBLista::User::Boosting
    include DBLista::User::Rating

    # Dozwolone typy
    ALLOWED_TYPES = %i[bot server].freeze

    attr_accessor :token

    def initialize(token)
      raise DBLista::Error, DBLista::Errors::TOKEN_NOT_PROVIDED unless token

      @token = token
    end
  end
end
