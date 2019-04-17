# frozen_string_literal: true

class ImportArticles
  include HTTParty
  base_uri Rails.application.config.olio_api_base_uri

  def self.call
    response = get('/test-articles.json')
    articles = JSON.parse(response.body)

    articles.each do |json_article|
      article_attributes = map_keys(json_article)
      Article.where(external_id: article_attributes[:external_id]).first_or_initialize.tap do |article|
        article.update article_attributes
      end
    end
  end

  private_class_method def self.map_keys(hash)
    {
      external_id: hash['id'],
      title: hash['title'],
      description: hash['description'],
      remote_likes: hash['reactions']['likes']
    }
  end
end
