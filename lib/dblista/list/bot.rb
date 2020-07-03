# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'cgi'

# Lists
#
# @example Fetch top 25 bots
#   top = DBLista::List::Bot.top
#   puts top['data'].inspect
module DBLista::List
  # Bot lists
  module Bot
    # Fetches top bots
    #
    # @param page [Integer] page
    # @return [Hash] raw data from DBLista
    def self.top(page = 0)
      DBLista._page_integer page
      DBLista._get("/bots/list/top/#{page}")
    end

    # Fetches premium bots
    #
    # @param page [Integer] page
    # @return [Hash] raw data from DBLista
    def self.premium(page = 0)
      DBLista._page_integer page
      DBLista._get("/bots/list/premium/#{page}")
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

    # Bot search
    #
    # @param query [String] query search
    # @return [Hash] raw data from DBLista
    def self.search(query)
      raise DBLista::Error, DBLista::Errors::QUERY_NOT_PROVIDED unless query

      DBLista._get("/bots/search/#{CGI.escape query}")
    end
  end
end
