class Image < ApplicationRecord
  belongs_to :room
  has_attached_file :file,
    styles: { medium: '400x300', small: '300x180' },
    default_url: 'images/:style/missing.png'
  validates_attachment :file, presence: true,
    content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] },
    size: { in: 0..4.megabytes }

  process_in_background :file
end
