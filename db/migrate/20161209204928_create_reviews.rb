class CreateReviews < ActiveRecord::Migration[5.0]

  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
