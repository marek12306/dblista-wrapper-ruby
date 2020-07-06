# frozen_string_literal: true

module DBLista::User
  # User client - rating
  module Rating
    # Sends rate for a selected bot/server
    #
    # @param id [Integer] entity ID
    # @param rating [Integer] rating from 0 to 5
    # @param details [String] details (description)
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def rate(id, rating, details, type = :bot)
      DBLista._validate_id id
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._post("/#{type}s/#{id}/rate", {
                      rating: rating,
                      details: details
                    }, @token)
      true
    end
    # Removes rate for a selected bot/server
    #
    # @param id [Integer] entity ID
    # @param target_id [Integer] target user to remove rate from (for owners only)
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def delete_rate(id, target_id = nil, type = :bot)
      DBLista._validate_id id
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._delete("/#{type}s/#{id}/rate/#{target_id}", nil, @token)
      true
    end
    # Reports rate of a selected bot/server
    #
    # @param id [Integer] ID
    # @param target_id [Integer] target user to remove rate from (for owners only)
    # @param report_reason [String] reason of report (details)
    # @param type [Symbol] type of entity (bot/server)
    # @return [Boolean] true if operation succeded
    def report_rate(id, rate_id, report_reason = 'Brak powodu', type = :bot)
      DBLista._validate_id id
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._post("/#{type}s/#{id}/ratings/#{rate_id}/report", {
                                                                   reportReason: report_reason.to_s
                                                                 }, @token)
      true
    end
    # Fetches all rate reports
    #
    # @return [Hash] raw data from DBLista
    def reports
      DBLista._get('/reports')
    end
    # Deletes rate report
    #
    # @param id [Integer] report ID
    # @return [Hash] raw data from DBLista
    def delete_report(id, type = :bot)
      raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

      DBLista._delete("/reports/#{id}", nil, @token)
      true
    end
    # Generates token for bot
    #
    # @param id [Integer] bot ID
    # @return [Hash] raw data from DBLista
    def generate_token(id)
      DBLista._validate_id id
      DBLista._get("/bots/stats/#{id}?token=#{@token}")
    end
  end
end
