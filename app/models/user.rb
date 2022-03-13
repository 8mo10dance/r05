# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :memos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
