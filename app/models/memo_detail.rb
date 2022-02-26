# frozen_string_literal: true

class MemoDetail < ApplicationRecord
  belongs_to :memo

  validates :content, presence: true
end
