# frozen_string_literal: true

require 'net/http'
require 'net/https'
require 'open-uri'
require 'json'

require_relative 'dblista/version'
require_relative 'dblista/info'
require_relative 'dblista/stats'
require_relative 'dblista/errors'
require_relative 'dblista/list/bot'
require_relative 'dblista/list/server'
require_relative 'dblista/user/client'

# Main module
module DBLista
  # DBLista error class
  class Error < StandardError; end
  # API path prefix
  API_PATH = 'https://api.dblista.pl/v1'
  # Regexp for checking if string is a number
  IS_NUMBER = /^\d+$/.freeze

  # @!visibility private
  def self._get(path)
    req = URI.open("#{DBLista::API_PATH}#{path}")
    JSON.parse req.read
  end

  def self._https(uri)
    Net::HTTP.new(uri.host, uri.port).tap do |http|
      http.use_ssl = true
    end
  end

  # @!visibility private
  def self._handle_request(req, uri, token, data)
    req.body = data.to_json if data
    req['Content-Type'] = 'application/json'
    req['Authorization'] = token if token
    response = _https(uri).request(req)
    JSON.parse response.body
  end

  # @!visibility private
  def self._post(path, data = nil, token = nil)
    uri = URI("#{DBLista::API_PATH}#{path}")
    req = Net::HTTP::Post.new(uri)
    _handle_request(req, uri, token, data)
  end

  # @!visibility private
  def self._delete(path, data = nil, token = nil)
    uri = URI("#{DBLista::API_PATH}#{path}")
    req = Net::HTTP::Delete.new(uri)
    _handle_request(req, uri, token, data)
  end

  # @!visibility private
  def self._put(path, data = nil, token = nil)
    uri = URI("#{DBLista::API_PATH}#{path}")
    req = Net::HTTP::Put.new(uri)
    _handle_request(req, uri, token, data)
  end

  # @!visibility private
  def self._validate_id(id)
    raise DBLista::Error, DBLista::Errors::ID_NEEDED unless DBLista::IS_NUMBER.match?(id.to_s)
  end

  # @!visibility private
  def self._page_integer(input)
    raise DBLista::Error, DBLista::Errors::PAGE_INTEGER unless input.is_a?(Integer)
  end
end
