# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { build(:article) }

  describe '#total_likes' do
    let(:total_likes) { article.remote_likes + article.local_likes }

    it 'returns the sum of local_likes and remote_likes' do
      expect(article.total_likes).to eq total_likes
    end
  end
end
