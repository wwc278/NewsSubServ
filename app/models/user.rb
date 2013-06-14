class User < ActiveRecord::Base
  attr_accessible :name, :subscriptions_attributes, :password, :token

  attr_accessor :password_hash

  has_many :subscriptions, :dependent => :destroy, :inverse_of => :user

  has_many :subscription_plans, :through => :subscriptions

  has_many :newspapers, :through => :subscription_plans

  validates :name, :presence => true

  accepts_nested_attributes_for :subscriptions, :reject_if => :all_blank



  def password= (password)
    self.password_digest = BCrypt::Password.create(password)
    self.token = SecureRandom.urlsafe_base64

  end



end

