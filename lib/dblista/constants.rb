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
    ADMINISTRATOR = 10
  end
  # Bot libraries
  module Libraries
    DISCORD_JS = :'discord.js'
    ERIS = :eris
    DSHARP_PLUS = :DSharpPlus
    DISCORD_NET = :'Discord.Net'
    DISCORDGO = :DiscordGo
    DISGORD = :DisGord
    JDA = :JDA
    DISCORD4J = :Discord4J
    JAVACORD = :Javacord
    AEGIS_CPP = :'aegis.cpp'
    NYXX = :nyxx
    RESTCORD = :RestCord
    DISCORD_PY = :'discord.py'
    DISCO = :disco
    DISCORDRB = :discordrb
    DISCORDRS = :'discord-rs'
    SERENITY = :serenity
    INNA = :inna
  end
end
