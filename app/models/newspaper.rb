class Newspaper < ActiveRecord::Base
  attr_accessible :name, :editor, :subscription_plans_attributes

  has_many :subscription_plans, :dependent => :destroy, :inverse_of => :newspaper

  accepts_nested_attributes_for :subscription_plans, :reject_if => :all_blank
end
