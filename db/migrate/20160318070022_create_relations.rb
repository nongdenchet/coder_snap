class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
