# frozen_string_literal: true

class Article < ApplicationRecord
  def total_likes
    local_likes + remote_likes
  end
end
