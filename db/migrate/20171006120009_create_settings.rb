class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.string :info
      t.string :contact_email
      t.string :email
      t.string :password
      t.timestamps null: false
    end
  end
end
