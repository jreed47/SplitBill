class Item < ActiveRecord::Base
  belongs_to :bill
  belongs_to :user

  validates :bill_id, :presence => true
  validates :user_id, :inclusion => {:in => User.all}
end
