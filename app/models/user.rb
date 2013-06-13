class User < ActiveRecord::Base
  attr_accessible :name, :subscriptions_attributes, :subscription_plans_attributes

  has_many :subscriptions
  has_many :subscription_plans, :through => :subscriptions

  accepts_nested_attributes_for :subscriptions, 
  :dependent => :destroy, 
  :inverse_of => :user

  accepts_nested_attributes_for :subscription_plans,
  :inverse_of => :


end
