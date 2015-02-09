class WordcloudsController < ApplicationController
  def index
    @wordclouds = Wordcloud.all
    @result = Wordcloud.cloud(params[:input])
  end

  def show
  end
end
