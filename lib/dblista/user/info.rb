# frozen_string_literal: true

module DList::User
  # User client - information
  module Information
    # Fetches your servers
    #
    # @return [Hash] raw data from DList
    def servers
      DList._get('/servers/user/me', @token)
    end

    # Fetches your bots
    #
    # @return [Hash] raw data from DList
    def bots
      DList._get('/bots/user/me', @token)
    end
  end
end
