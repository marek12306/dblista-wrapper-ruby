# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'cgi'

# Lists
#
# @example Fetch top 25 bots
#   top = DBLista::List::Bot.top
#   puts top.inspect
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
      DBLista._get("/bots/list/top/#{page}?limit=#{limit}")
    end

    # Fetches premium bots
    #
    # @param page [Integer] page
    # @param limit [Integer] limit of bots per page
    # @return [Hash] raw data from DBLista
    def self.premium(page = 0, limit = 10)
      DBLista._page_integer page
      DBLista._limit_integer limit
      DBLista._get("/bots/list/premium/#{page}?limit=#{limit}")
    end

    # Fetches unverified bots
    #
    # @return [Hash] raw data from DBLista
    def self.unverified
      DBLista._get('/bots/list/unverified')
    end

    # Fetches rejected bots
    #
    # @return [Hash] raw data from DBLista
    def self.rejected
      DBLista._get('/bots/list/rejected')
    end

    # Fetches all bots
    #
    # @return [Array] array of raw bot data from DBLista
    def self.all
      DBLista::List::Bot.top(0, 100_000_000)
    end

    # Bot search
    #
    # @param query [String] query search
    # @return [Hash] raw data from DBLista
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._get("/bots/search/#{CGI.escape query.to_s}")
    end
  end
end
