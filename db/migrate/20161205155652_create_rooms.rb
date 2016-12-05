class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.belongs_to :user, foreign_key: true
      t.string :city, null: false
      t.string :country, null: false

      t.timestamps
    end
  end
end
