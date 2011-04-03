class Ledger < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :item_id,:user_id, :money_owed, :presence => true
  validates :user_id, :inclusion => {:in => User.all.collect{|user| user.id}}


end

# == Schema Information
#
# Table name: ledgers
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  item_id    :integer
#  money_owed :float
#  paid       :boolean
#  created_at :datetime
#  updated_at :datetime
#

