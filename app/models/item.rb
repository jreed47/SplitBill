class Item < ActiveRecord::Base
  belongs_to :bill
  has_many :users, :through => :ledgers

  validates :bill_id, :presence => true
#  validates :user_id, :inclusion => {:in => User.all}
end
