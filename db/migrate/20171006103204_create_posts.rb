class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.string  :name
    	t.text    :content
    	t.attachment :file
      t.timestamps
    end
  end
end
