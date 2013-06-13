class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.integer :newspaper_id
      t.float :price
      t.boolean :weekly
    end
  end
end
