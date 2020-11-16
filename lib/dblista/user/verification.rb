# frozen_string_literal: true

require 'cgi'

module DList::User
  # User client - verification (only for staff)
  module Verification
    # Approves specified bot
    #
    # @param id [Integer] bot ID
    # @param reason [String] reason for approving
    # @return [Boolean] true if operation succeded
    def approve(id, reason = 'Brak powodu')
      DList._validate_id id

      DList._post("/bots/verify/#{id}/approve?reason=#{CGI.escape reason}", nil, @token)
      true
    end

    # Rejects  specified bot
    #
    # @param id [Integer] bot ID
    # @param reason [String] reason for rejecting
    # @return [Boolean] true if operation succeded
    def reject(id, reason = 'Brak powodu')
      DList._validate_id id

      DList._post("/bots/verify/#{id}/reject?reason=#{CGI.escape reason}", nil, @token)
      true
    end

    # Sets specified bot verification status to pending
    #
    # @param id [Integer] bot ID
    # @return [Boolean] true if operation succeded
    def set_pending(id)
      DList._validate_id id

      DList._post("/bots/#{id}/set-pending", nil, @token)
      true
    end
  end
end
