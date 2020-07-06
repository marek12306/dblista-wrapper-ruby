# frozen_string_literal: true

module DBLista::User
  # User client - information
  module Information
    # Fetches your servers
    #
    # @return [Hash] raw data from DBLista
    def servers
      DBLista._get('/servers/user/me', nil, @token)
    end

    # Fetches your bots
    #
    # @return [Hash] raw data from DBLista
    def bots
      DBLista._get('/bots/user/me', nil, @token)
    end
  end
end
