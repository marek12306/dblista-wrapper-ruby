# frozen_string_literal: true

require 'net/https'
require 'json'

module DBLista
  # Klasa do aktualizowania statystyk
  #
  # @example Automatyczne wysyłanie statystyk
  #   bot = Discordrb::Bot.new token: 'TOKEN'
  #   dbl = DBLista::Stats.new 'DBLISTA_TOKEN', bot
  class Stats
    attr_accessor :token

    # @param token [String] token dla bota od DBListy
    # @param bot [Discordrb::Bot] instancja bota
    def initialize(token, bot = nil)
      raise DBLista::Error, DBLista::Errors::TOKEN_NOT_PROVIDED unless token

      @token = token
      if bot&.connected?
        hook_bot(bot)
      elsif bot
        bot.ready { hook_bot(bot) }
      end
    end

    # Przyłącza bota napisanego w discordrb do klienta statystyk
    #
    # @param bot [Discordrb::Bot] bot
    # @return [Thread] wątek który aktualizuje statystyki
    def hook_bot(bot)
      @thread.exit if @thread&.alive?
      @thread = Thread.new do
        update_stats(bot.users.size, bot.servers.size)
        sleep 10 * 60
      end
      @thread
    end

    # Wysyła statystyki do DBListy
    #
    # @param members [Integer] liczba userów
    # @param servers [Integer] liczba serwerów
    # @return [Hash] raw data from DBLista
    def update_stats(members, servers)
      DBLista._post('/bots/stats', {
                      'servers' => servers,
                      'members' => members
                    }, @token)
    end
  end
end
