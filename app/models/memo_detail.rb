class MemoDetail < ApplicationRecord
  belongs_to :memo

  validates :content, presence: true
end
