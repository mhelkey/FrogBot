require 'discordrb'
require './environment.rb'
require './hash_generator.rb'


class DeployBot

    def initialize
        @my_bot = Discordrb::Bot.new token: ENV["DISCORD_TOKEN"], client_id: ENV["APPLICATION_ID"]
        @my_bot.run true

        command_hash = HashGenerator.new("triggers_and_responses.csv")

        # @my_bot.message contains: "~info" do |event|
        #     event.respond "TEST RUBY BOT CONNECTED"
        # end

        @my_bot.message content: /[~]\w+/ do |event|
            trigger_string = event.content[/[~]\w+/]
            trigger_string[0] = '' # gets rid of first char

            if command_hash.hash.key?(trigger_string)
                event.respond command_hash.hash[trigger_string]
            else
                event.respond "I'm sorry. That is not a command I recognize."
            end
            # event.respond command_hash.hash[]
            # event.respond command_hash.hash["info"]
            # event.respond "This worked"
        end

        #commands go here

        @my_bot.join
    end

end

DeployBot.new