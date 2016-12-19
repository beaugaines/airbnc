class AddReviewsCountToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :reviews_count, :integer, default: 0
  end
end
