class CreateSpreeDynamicBmsmGroups < ActiveRecord::Migration
  def change
    create_table :spree_dynamic_bmsm_groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
