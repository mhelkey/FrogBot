require 'discordrb'
require './environment.rb'
require 'response-parser'

@my_bot = Discordrb::Bot.new token: ENV["DISCORD_TOKEN"], 
    client_id: ENV["APPLICATION_ID"], prefix: "~"

@my_bot.run true

@my_bot.message contains: "~info" do |event|
    event.respond "TEST RUBY BOT CONNECTED"
end




@my_bot.join