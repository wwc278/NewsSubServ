class Subscription < ActiveRecord::Base
  attr_accessible :user_id, :subscription_plan_id

  belongs_to :user
  belongs_to :subscription_plan
end
