class WordcloudsController < ApplicationController
  def index
    # @result = Wordcloud.cloud(params[:input])
    # @result = "http://www.craigslist.org"
    # @result = Song.last.lyrics
    @result = Tweet.fetch_timeline(params[:tweet])
  end

  def show
  end
end
