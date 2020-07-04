# frozen_string_literal: true

# Helper methods
module DBLista::Helpers
  def self.get_avatar(id, hash, size = 2048)
    "https://cdn.discordapp.com/avatars/#{id}/#{hash}?size=#{size}"
  end
end
