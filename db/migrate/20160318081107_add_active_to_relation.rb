class AddActiveToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :active, :boolean, default: false
  end
end
