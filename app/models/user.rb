# frozen_string_literal: true

class User < ApplicationRecord
  has_many :memos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
