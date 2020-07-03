# frozen_string_literal: true

require 'cgi'

module DBLista::List
  # Lista serwerów
  module Server
    # Pobiera topkę serwerów
    #
    # @param page [Integer] strona
    # @return [Hash] surowe dane od DBListy
    def self.top(page = 0)
      DBLista._page_integer page
      DBLista._get("/servers/list/top/#{page}")
    end

    # Pobiera serwery premium
    #
    # @param page [Integer] strona
    # @return [Hash] surowe dane od DBListy
    def self.premium(page = 0)
      DBLista._page_integer page
      DBLista._get("/servers/list/premium/#{page}")
    end

    # Wyszukuje serwery
    #
    # @param query [String] zapytanie do wyszukiwarki
    # @return [Hash] surowe dane od DBListy
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._get("/servers/search/#{CGI.escape query}")
    end
  end
end
