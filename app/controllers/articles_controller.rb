# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    ImportArticles.call

    @articles = Article.all
  end

  def like
    article = Article.find(params[:id])

    article.increment! :local_likes

    redirect_to articles_path
  end
end
