# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'cgi'

# Listy
#
# @example Pobiera topkę serwerów
#   top = DBLista::List::Bot.top
#   puts top['data'].inspect
module DBLista::List
  # Bot lists
  module Bot
    # Pobiera topkę botów
    #
    # @param page [Integer] strona
    # @return [Hash] surowe dane od DBListy
    def self.top(page = 0)
      DBLista._page_integer page
      DBLista._get("/bots/list/top/#{page}")
    end

    # Pobiera boty premium
    #
    # @param page [Integer] strona
    # @return [Hash] surowe dane od DBListy
    def self.premium(page = 0)
      DBLista._page_integer page
      DBLista._get("/bots/list/premium/#{page}")
    end

    # Fetches unverified bots
    #
    # @return [Hash] surowe dane od DBListy
    def self.unverified
      DBLista._get('/bots/list/unverified')
    end

    # Pobiera odrzucone boty
    #
    # @return [Hash] surowe dane od DBListy
    def self.rejected
      DBLista._get('/bots/list/rejected')
    end

    # Wyszukuje bota
    #
    # @param query [String] zapytanie do wyszukiwarki
    # @return [Hash] surowe dane od DBListy
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._get("/bots/search/#{CGI.escape query}")
    end
  end
end
