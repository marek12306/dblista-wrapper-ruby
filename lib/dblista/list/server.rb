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

    # Fetches all servers
    #
    # @return [Array] array of raw server data from DBLista
    def self.all
      servers = []
      i = 0
      loop do
        page = DBLista::List::Server.top(i)
        break if page.length.zero?

        servers += page
        i += 1
      end
      servers
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
