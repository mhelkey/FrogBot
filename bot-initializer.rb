require 'discordrb'

@my_bot = Dsicordrb::Bot.new token: ENV["DISCORD_TOKEN"], client_id: ENV["APPLICATION_ID"]

@my_bot.run true

# commands go here!

@my_bot.join