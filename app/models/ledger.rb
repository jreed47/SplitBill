class Ledger < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :item_id,:user_id, :presence => true
  validates :user_id, :inclusion => {:in => User.all.collect{|user| user.id}}


end
