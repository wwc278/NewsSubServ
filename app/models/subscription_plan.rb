class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :newspaper_id, :price, :weekly

  belongs_to :newspaper, :inverse_of => :subscription_plans

  validates :newspaper, :presence => true
  validates_inclusion_of :weekly, :in => [true, false]

  


end
