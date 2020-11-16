# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'cgi'

# Lists
#
# @example Fetch top 25 bots
#   top = DList::List::Bot.top
#   puts top
module DList::List
  # Bot lists
  module Bot
    # Fetches top bots
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of bots per page
    # @return [Hash] raw data from DList
    def self.top(page = 0, limit = 10)
      DList._page_integer page
      DList._limit_integer limit
      DList._cache("botstop#{page}-#{limit}") do
        DList._get("/bots/list/top/#{page}?limit=#{limit}")
      end
    end

    # Fetches premium bots
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of bots per page
    # @return [Hash] raw data from DList
    def self.premium(page = 0, limit = 10)
      DList._page_integer page
      DList._limit_integer limit
      DList._cache("botspremium#{page}-#{limit}") do
        DList._get("/bots/list/premium/#{page}?limit=#{limit}")
      end
    end

    # Fetches unverified bots
    #
    # @return [Hash] raw data from DList
    def self.unverified
      DList._cache(:botsunverified) do
        DList._get('/bots/list/unverified')
      end
    end

    # Fetches rejected bots
    #
    # @return [Hash] raw data from DList
    def self.rejected
      DList._cache(:botsrejected) do
        DList._get('/bots/list/rejected')
      end
    end

    # Fetches all bots
    #
    # @return [Array] array of raw bot data from DList
    def self.all
      DList._cache(:botsall) do
        DList._get('/bots/list/top/0?limit=1000000')
      end
    end

    # Bot search
    #
    # @param query [String] query search
    # @return [Hash] raw data from DList
    def self.search(query)
      raise DList::Error, DList::Errors::QUERY_NOT_PROVIDED unless query

      DList._cache("botsearch#{query}") do
        DList._get("/bots/search/#{CGI.escape query.to_s}")
      end
    end
  end
end
