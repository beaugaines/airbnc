class Room < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :images, dependent: :destroy, inverse_of: :room
  accepts_nested_attributes_for :images
end
