# frozen_string_literal: true

module DBLista
  # Tags
  module Tags
    # Bot tags
    module Bot
      MODERATION = :moderacja
      TOOLS = :narzędzia
      MUSIC = :muzyka
      DASHBOARD = :panel
      FUN = :rozrywka
      LEVELS = :poziomy
      GAMES = :gry
      ROLEPLAY = :roleplay
      ECONOMY = :ekonomia
      ANIME = :anime
      NSFW = :nsfw
      OTHER = :inne
    end
    # Server tags
    module Server
      COMMUNITY = :community
      PROGRAMMING = :programowanie
      GAMES = :gry
      YOUTUBE = :youtube
      HOBBY = :hobby
      ANIME = :anime
      ROLEPLAY = :roleplay
      OTHER = :inne
    end
  end
  # Permissions
  module Permissions
    USER = 0
    MODERATOR = 1
    BIG_MODERATOR = 2
    ADMINISTRATOR = 3
  end
end
