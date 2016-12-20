class CreateHelpfuls < ActiveRecord::Migration[5.0]
  def change
    create_table :helpfuls do |t|
      t.references :user, index: true, foreign_key: true
      t.references :review, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
