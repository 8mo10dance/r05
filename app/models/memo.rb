class Memo < ApplicationRecord
  belongs_to :user
  has_many :memo_details, dependent: :destroy

  validates :title, presence: true
end
