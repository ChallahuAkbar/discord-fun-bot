# frozen_string_literal: true

bot = Discordrb::Bot.new token: 'MjEwNjk5MTg4MTQzMzkwNzIw.CoSljw.eT3hb1uZZWaaeJeGkbmxGdP1T-Q', application_id: 210699188143390720

bot.message(with_text: 'ping') { |event| event.respond 'pong' }

bot.run
