# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'cgi'

# Lists
#
# @example Fetch top 25 bots
#   top = DBLista::List::Bot.top
#   puts top
module DBLista::List
  # Bot lists
  module Bot
    # Fetches top bots
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of bots per page
    # @return [Hash] raw data from DBLista
    def self.top(page = 0, limit = 10)
      DBLista._page_integer page
      DBLista._limit_integer limit
      DBLista._cache("botstop#{page}-#{limit}") do
        DBLista._get("/bots/list/top/#{page}?limit=#{limit}")
      end
    end

    # Fetches premium bots
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of bots per page
    # @return [Hash] raw data from DBLista
    def self.premium(page = 0, limit = 10)
      DBLista._page_integer page
      DBLista._limit_integer limit
      DBLista._cache("botspremium#{page}-#{limit}") do
        DBLista._get("/bots/list/premium/#{page}?limit=#{limit}")
      end
    end

    # Fetches unverified bots
    #
    # @return [Hash] raw data from DBLista
    def self.unverified
      DBLista._cache(:botsunverified) do
        DBLista._get('/bots/list/unverified')
      end
    end

    # Fetches rejected bots
    #
    # @return [Hash] raw data from DBLista
    def self.rejected
      DBLista._cache(:botsrejected) do
        DBLista._get('/bots/list/rejected')
      end
    end

    # Fetches all bots
    #
    # @return [Array] array of raw bot data from DBLista
    def self.all
      DBLista._cache(:botsall) do
        DBLista._get("/bots/list/top/0?limit=1000000")
      end
    end

    # Bot search
    #
    # @param query [String] query search
    # @return [Hash] raw data from DBLista
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._cache("botsearch#{query}") do
        DBLista._get("/bots/search/#{CGI.escape query.to_s}")
      end
    end
  end
end
