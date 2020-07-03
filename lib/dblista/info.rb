# frozen_string_literal: true

require 'open-uri'
require 'json'

module DBLista
  # Moduł do pobierania danych o userach, botach i serwerach
  #
  # @example Sprawdzanie informacji o userze
  #   info = DBLista::Information.user 123456789012345678
  #   puts info['data']
  module Information
    # Pobiera informacje o bocie od DBListy
    #
    # @param id [Integer] ID bota
    # @return [Hash] surowe dane od DBListy
    def self.bot(id)
      DBLista._validate_id id
      DBLista._get("/bots/#{id}")
    end

    # Pobiera informacje o serwerze od DBListy
    #
    # @param id [Integer] ID serwera
    # @return [Hash] surowe dane od DBListy
    def self.server(id)
      DBLista._validate_id id
      DBLista._get("/servers/#{id}")
    end

    # Pobiera informacje o userze z DBListy
    #
    # @param id [Integer] ID usera
    # @return [Hash] surowe dane od DBListy
    def self.user(id)
      DBLista._validate_id id
      DBLista._get("/users/#{id}")
    end
  end
end
