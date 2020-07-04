# frozen_string_literal: true

# Helper methods
module DBLista::Helpers
  # Crafts avatar url from user ID and avatar hash
  #
  # @param id [Integer] user ID
  # @param hash [String] avatar hash
  # @param size [Integer] avatar width (defaults to 2048)
  # @return [Hash] raw data from DBLista
  def self.get_avatar(id, hash, size = 2048)
    "https://cdn.discordapp.com/avatars/#{id}/#{hash}?size=#{size}"
  end
end
