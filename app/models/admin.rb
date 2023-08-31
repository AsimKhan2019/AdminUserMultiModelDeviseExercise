class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
  belongs_to :account

  def active_for_authentication?
    super && account_active? 
  end
  
  def account_active? 
    account.present? && account.is_active && !account.has_expired 
  end 
end
