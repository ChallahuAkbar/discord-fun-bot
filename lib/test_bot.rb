# frozen_string_literal: true

require 'discordrb'

bot = Discordrb::Bot.new(
  token: 'MjEwNjk5MTg4MTQzMzkwNzIw.CqbFcg.ZruXXrQ0sVc_Le7A_QgZnEen3DI',
  client_id: 210699188143390720
)

bot.message(contains: /happy birthday|birthday|happy bday|bday/i) do |event|
  event.respond 'お誕生日おめでとうございます'
end

bot.message_delete do |event|
  event.respond('***CENSORSHIP!!!!!!!***')
end

bot.heartbeat do |_event|
  if Time.now.min.zero?
    bot.servers.each do |_id, server|
      bot.voice_connect(server.channels.detect { |channel| channel.to_lowercase == 'general' })
      hour = Time.now.hour % 12
      if hour.zero?
        12.times { bot.voice(server).play_file('assets/chime.mp3') }
      else
        hour.times { bot.voice(server).play_file('assets/chime.mp3') }
      end
      bot.voice(server).destroy
    end
  end
end

bot.run
