class WordcloudsController < ApplicationController
  def index
    @result = Wordcloud.cloud(params[:input])
  #   @result = "http://www.craigslist.org"
  end

  def show
  end
end
