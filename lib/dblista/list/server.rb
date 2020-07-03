# frozen_string_literal: true

require 'cgi'

module DBLista::List
  # Server lists
  module Server
    # Fetches top servers
    #
    # @param page [Integer] page
    # @return [Hash] raw data from DBLista
    def self.top(page = 0)
      DBLista._page_integer page
      DBLista._get("/servers/list/top/#{page}")
    end

    # Fetches premium servers
    #
    # @param page [Integer] page
    # @return [Hash] raw data from DBLista
    def self.premium(page = 0)
      DBLista._page_integer page
      DBLista._get("/servers/list/premium/#{page}")
    end

    # Server search
    #
    # @param query [String] search query
    # @return [Hash] raw data from DBLista
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._get("/servers/search/#{CGI.escape query}")
    end
  end
end
