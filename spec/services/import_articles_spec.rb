# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportArticles, type: :service do
  before do
    json_articles_path = Rails.root.join('spec', 'fixtures', 'articles.json')
    response = instance_double('HTTParty::Response', body: File.read(json_articles_path))
    allow(ImportArticles).to receive(:get).and_return(response)
  end

  describe '#call' do
    context 'when no articles were present in the database' do
      it 'imports articles' do
        ImportArticles.call

        expect(Article.count).to eq 20
      end
    end

    context 'when articles were present in the database' do
      before do
        create(:article, external_id: 195_538, title: 'Fish and chips')
      end

      it 'imports articles' do
        ImportArticles.call

        expect(Article.count).to eq 20
      end

      it 'updates attributes values' do
        ImportArticles.call

        expect(Article.find_by(external_id: 195_538).title).to eq 'Sandwiches'
      end
    end
  end
end
