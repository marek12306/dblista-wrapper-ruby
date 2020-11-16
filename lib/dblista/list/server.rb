# frozen_string_literal: true

require 'cgi'

module DList::List
  # Server lists
  module Server
    # Fetches top servers
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of servers per page
    # @return [Hash] raw data from DList
    def self.top(page = 0, limit = 10)
      DList._page_integer page
      DList._limit_integer limit
      DList._cache("serverstop#{page}-#{limit}") do
        DList._get("/servers/list/top/#{page}?limit=#{limit}")
      end
    end

    # Fetches premium servers
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of servers per page
    # @return [Hash] raw data from DList
    def self.premium(page = 0, limit = 10)
      DList._page_integer page
      DList._limit_integer limit
      DList._cache("serverspremium#{page}-#{limit}") do
        DList._get("/servers/list/premium/#{page}?limit=#{limit}")
      end
    end

    # Fetches all servers
    #
    # @return [Array] array of raw server data from DList
    def self.all
      DList._cache(:serversall) do
        DList._get('/servers/list/top/0?limit=1000000')
      end
    end

    # Server search
    #
    # @param query [String] search query
    # @return [Hash] raw data from DList
    def self.search(query)
      raise DList::Error, DList::Errors::QUERY_NOT_PROVIDED unless query

      DList._cache("serversearch#{query}") do
        DList._get("/servers/search/#{CGI.escape query.to_s}")
      end
    end
  end
end
