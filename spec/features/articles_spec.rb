# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'View and like articles', type: :feature do
  before do
    allow(ImportArticles).to receive(:call)

    create(:article, title: 'Lentils soup', remote_likes: 5, local_likes: 2)

    visit articles_path
  end

  it 'shows articles' do
    expect(page).to have_content('Lentils soup')
  end

  it 'stores global likes' do
    click_link 'Like'

    expect(page).to have_content(8) # 5 remote likes + 3 local likes
  end
end
