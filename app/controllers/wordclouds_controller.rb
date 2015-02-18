class WordcloudsController < ApplicationController
  def index
    @result = Wordcloud.cloud(Tweet.fetch_timeline(params[:input]))
    # @result = "http://www.craigslist.org"
    # @result = Song.last.lyrics
    # @result = Tweet.fetch_timeline(params[:input])
  end

  def show
  end
end
