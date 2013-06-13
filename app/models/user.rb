class User < ActiveRecord::Base
  attr_accessible :name, :subscriptions_attributes

  has_many :subscriptions, :dependent => :destroy, :inverse_of => :user

  has_many :subscription_plans, :through => :subscriptions

  has_many :newspapers, :through => :subscription_plans

  validates :name, :presence => true

  accepts_nested_attributes_for :subscriptions, :reject_if => :all_blank
end

