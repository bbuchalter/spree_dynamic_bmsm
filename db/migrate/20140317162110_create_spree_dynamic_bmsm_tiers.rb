class CreateSpreeDynamicBmsmTiers < ActiveRecord::Migration
  def change
    create_table :spree_dynamic_bmsm_tiers do |t|
      t.reference :spree_dynamic_bmsm_groups
      t.string :label
      t.float :level
      t.float :discount

      t.timestamps
    end
  end
end
