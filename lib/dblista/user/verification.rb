# frozen_string_literal: true

require 'cgi'

module DBLista::User
  # User client - verification (only for staff)
  module Verification
  # Approves specified bot
  #
  # @param id [Integer] bot ID
  # @param reason [String] reason for approving
  # @return [Boolean] true if operation succeded
  def approve(id, reason = 'Brak powodu')
    DBLista._validate_id id

    DBLista._post("/botss/#{id}/approve?reason=#{CGI.escape reason}", nil, @token)
    true
  end

  # Rejects  specified bot
  #
  # @param id [Integer] bot ID
  # @param reason [String] reason for rejecting
  # @return [Boolean] true if operation succeded
  def reject(id, reason = 'Brak powodu')
    DBLista._validate_id id

    DBLista._post("/botss/#{id}/reject?reason=#{CGI.escape reason}", nil, @token)
    true
  end

  # Sets specified bot verification status to pending
  #
  # @param id [Integer] bot ID
  # @return [Boolean] true if operation succeded
  def set_pending(id)
    DBLista._validate_id id

    DBLista._post("/botss/#{id}/set-pending", nil, @token)
    true
  end
  end
end
