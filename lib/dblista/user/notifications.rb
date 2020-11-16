# frozen_string_literal: true

module DList::User
  # User client - notifications
  module Notifications
    # Fetches user notifications
    #
    # @return [Hash] raw data from DList
    def notifications
      DList._get('/users/me/notifications/read', @token)
    end

    # Clears user notifications
    #
    # @return [Boolean] true if operation succeded
    def clear_notifications
      DList._get('/users/me/notifications/clear', @token)
      true
    end

    # Sends notification to specified user
    # Available only for DList staff
    #
    # @param rank [Integer] user ID
    # @param details [String] details (content)
    # @param url [String] url to redirect if clicked
    # @return [Boolean] true if operation succeded
    def send_notification(id, details, url = '#')
      DList._validate_id id
      DList._post("/users/#{id}/notifications", {
                      text: details,
                      url: url || '#'
                    }, @token)
      true
    end

    # Sends notification to specified group (rank)
    # Available only for DList staff
    #
    # @param rank [Integer] rank ID
    # @param details [String] details (content)
    # @param url [String] url to redirect if clicked
    # @return [Boolean] true if operation succeded
    def send_group_notification(rank, details, url = '#')
      DList._post("/users/group/#{rank}/notifications", {
                      text: details,
                      url: url || '#'
                    }, @token)
      true
    end
  end
end
