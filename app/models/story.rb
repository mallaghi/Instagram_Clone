class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true, blob: { content_type: :image }
end

