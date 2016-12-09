class AddBodyToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :body, :text
  end
end
