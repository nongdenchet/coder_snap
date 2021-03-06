class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :content
      t.boolean :seen, default: false

      t.timestamps null: false
    end
  end
end
