# frozen_string_literal: true
require 'koala'
require_relative 'test_bot'

Koala.config.api_version = 'v2.7'

graph = Koala::Facebook::API.new('1770482843164201|bDU2Cy5rS73b1_UvxmSvvhQjO20')
posts = graph.get_connections('PeterDinklage', 'posts',
                              limit: 1, fields: %w(permalink_url link message))
post = posts[0]

permalink = post['permalink_url'] unless post['permalink_url'].empty?
link = post['link'] unless post['link'].empty?
post_contents = post['message'] unless post['message'].empty?

link + '\n' unless post_contents.gsub!(link, '')
@message = "Post: #{link} #{post_contents}\nPermalink: #{permalink}"
# bot.message(with_text: 'danklage', in: 'testinshit') { |event| event.respond 'foo' }
