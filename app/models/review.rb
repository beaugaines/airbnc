class Review < ApplicationRecord
  belongs_to :room, counter_cache: true
  belongs_to :user
end
