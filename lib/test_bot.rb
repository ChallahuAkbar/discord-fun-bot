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

bot.message(contains('time test')) do |event|
  # if Time.now.minute.zero?
    bot.voice_connect('General')
    Time.now.hour.times do
      event.voice.play_io(open('https://retired.sounddogs.com/previews/25/mp3/307523_SOUNDDOGS__cl.mp3'))
    end
  # end
end

bot.run
