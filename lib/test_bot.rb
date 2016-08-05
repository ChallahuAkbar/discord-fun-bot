# frozen_string_literal: true
require 'discordrb'
require 'koala'

bot = Discordrb::Bot.new token: 'MjEwNjk5MTg4MTQzMzkwNzIw.CoSljw.eT3hb1uZZWaaeJeGkbmxGdP1T-Q',
                         application_id: '210699188143390720', name: 'Adrien-BOT'

bot.message(with_text: 'ping') { |event| event.respond 'pong' }
bot.ready { |event| event.bot.game = 'Stalking people on Facebook' }

# NOTE: TEMP
Koala.config.api_version = 'v2.7'

graph = Koala::Facebook::API.new('1770482843164201|bDU2Cy5rS73b1_UvxmSvvhQjO20')
posts = graph.get_connections('PeterDinklage', 'posts',
                              limit: 1, fields: %w(permalink_url link message))
post = posts[0]

permalink = post['permalink_url'] unless post['permalink_url'].empty?
link = post['link'] unless post['link'].empty?
post_contents = post['message'] unless post['message'].empty?

post_contents.gsub!(link, '') || link + '\n'
message = "Post: #{link} #{post_contents}\nPermalink: #{permalink}"
bot.message(with_text: 'danklage', in: 'testinshit') { |event| event.respond message }
# NOTE: END TEMP

# require_relative 'peter_dinklage'
# bot.message(with_text: 'danklage', in: 'testinshit') { |event| event.respond @message }

bot.run
