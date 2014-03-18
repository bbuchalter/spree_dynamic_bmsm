class CreateSpreeDynamicBmsmTiers < ActiveRecord::Migration
  def change
    create_table :spree_dynamic_bmsm_tiers do |t|
      t.integer :spree_dynamic_bmsm_groups_id
      t.string :label
      t.float :level
      t.float :discount

      t.timestamps
    end
  end
end
