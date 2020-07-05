# frozen_string_literal: true

require 'cgi'

module DBLista::List
  # Server lists
  module Server
    # Fetches top servers
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of servers per page
    # @return [Hash] raw data from DBLista
    def self.top(page = 0, limit = 10)
      DBLista._page_integer page
      DBLista._limit_integer limit
      DBLista._get("/servers/list/top/#{page}?limit=#{limit}")
    end

    # Fetches premium servers
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of servers per page
    # @return [Hash] raw data from DBLista
    def self.premium(page = 0, limit = 10)
      DBLista._page_integer page
      DBLista._limit_integer limit
      DBLista._get("/servers/list/premium/#{page}?limit=#{limit}")
    end

    # Fetches all servers
    #
    # @return [Array] array of raw server data from DBLista
    def self.all
      DBLista::List::Server.top(0, 100_000_000)
    end

    # Server search
    #
    # @param query [String] search query
    # @return [Hash] raw data from DBLista
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._get("/servers/search/#{CGI.escape query.to_s}")
    end
  end
end
