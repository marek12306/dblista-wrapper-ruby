# frozen_string_literal: true

require 'net/https'
require 'json'

module DBLista
  # Class for updating bot statistics
  #
  # @example Hook bot stats to DBLista
  #   bot = Discordrb::Bot.new token: 'TOKEN'
  #   dbl = DBLista::Stats.new 'DBLISTA_TOKEN', bot
  class Stats
    attr_accessor :token

    # @param token [String] DBLista bot token
    # @param bot [Discordrb::Bot] discordrb bot for auto-sending statistics
    def initialize(token, bot = nil)
      raise DBLista::Error, DBLista::Errors::TOKEN_NOT_PROVIDED unless token

      @token = token
      if bot&.connected?
        hook_bot(bot)
      elsif bot
        bot.ready { hook_bot(bot) }
      end
    end

    # Hooks discordrb bot to stats client instance
    #
    # @param bot [Discordrb::Bot] the bot
    # @return [Thread] stat updating thread
    def hook_bot(bot)
      @thread.exit if @thread&.alive?
      @thread = Thread.new do
        update_stats(bot.users.size, bot.servers.size)
        sleep 10 * 60
      end
      @thread
    end

    # Sends statistics to DBLista
    #
    # @param members [Integer] member count
    # @param servers [Integer] server count
    # @return [Hash] raw data from DBLista
    def update_stats(members, servers)
      DBLista._post('/bots/stats', {
                      'servers' => servers,
                      'members' => members
                    }, @token)
    end
  end
end
