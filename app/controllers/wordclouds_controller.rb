class WordcloudsController < ApplicationController
  def index
    @result = Wordcloud.cloud(params[:input])
  #   @result = "http://www.craigslist.org"
    @song = Song.last

  end

  def show
  end
end
