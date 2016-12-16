class AddFileProcessingToImage < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :file_processing, :boolean
  end
end
