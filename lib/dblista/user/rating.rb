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
  # @return [Hash] raw data from DBLista
  def rate(id, rating, details, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless ALLOWED_TYPES.include?(type)

    DBLista._post("/#{type}s/#{id}/rate", {
                    rating: rating,
                    details: details
                  }, @token)
  end

  # Removes rate for a selected bot/server
  #
  # @param id [Integer] entity ID
  # @param target_id [Integer] target user to remove rate from (for owners only)
  # @param type [Symbol] type of entity (bot/server)
  # @return [Hash] raw data from DBLista
  def delete_rate(id, target_id = nil, type = :bot)
    DBLista._validate_id id
    raise DBLista::Error, DBLista::Errors::TYPE_NOT_ALLOWED unless DBLista::User::Client::ALLOWED_TYPES.include?(type)

    DBLista._delete("/#{type}s/#{id}/rate/#{target_id}", nil, @token)
  end
  end
end
