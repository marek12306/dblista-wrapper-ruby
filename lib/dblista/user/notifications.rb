# frozen_string_literal: true

module DBLista::User
  # User client - notifications
  module Notifications
  # Fetches user notifications
  #
  # @return [Hash] raw data from DBLista
  def notifications
    DBLista._get('/users/me/notifications/read', @token)
  end

  # Clears user notifications
  #
  # @return [Hash] raw data from DBLista
  def clear_notifications
    DBLista._delete('/users/me/notifications/clear', @token)
  end
  end
end
