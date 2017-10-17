class CreatePostFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :post_files do |t|
      t.integer :post_id
      t.attachment :file
      t.timestamps
    end
  end
end
