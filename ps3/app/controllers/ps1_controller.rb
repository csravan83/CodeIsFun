require 'nokogiri'
require 'open-uri'
require 'htmlentities'

class Ps1Controller < ApplicationController

  def page
    url = "https://www.nytimes.com/"
    @data = Nokogiri::HTML.parse(open(url))
    #puts data.title

    @site_data = @data.css('.story-heading a')

    #@site_data.each do |news|
    # @story_heading = news.text.strip
    # @link_to_story = news['href']

  end
end
