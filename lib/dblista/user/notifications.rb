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
    DBLista._get('/users/me/notifications/clear', @token)
  end

  # Sends notification to specified user
  # Available only for DBLista staff
  #
  # @param rank [Integer] user ID
  # @param details [String] details (content)
  # @param url [String] url to redirect if clicked
  # @return [Hash] raw data from DBLista
  def send_notification(id, details, url = '#')
    DBLista._validate_id id
    DBLista._post("/users/#{id}/notifications", {
                    text: details,
                    url: url || '#'
                  }, @token)
  end

  # Sends notification to specified group (rank)
  # Available only for DBLista staff
  #
  # @param rank [Integer] rank ID
  # @param details [String] details (content)
  # @param url [String] url to redirect if clicked
  # @return [Hash] raw data from DBLista
  def send_group_notification(rank, details, url = '#')
    DBLista._post("/users/group/#{rank}/notifications", {
                    text: details,
                    url: url || '#'
                  }, @token)
  end
  end
end
