class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string  :commentable_type
      t.string  :author
    	t.text    :content
      t.timestamps
    end
  end
end
