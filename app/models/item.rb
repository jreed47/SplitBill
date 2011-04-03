class Item < ActiveRecord::Base
  belongs_to :bill
  has_many :ledgers

  validates :name,:price,:bill_id, :presence => true
  validates :bill_id, :inclusion => {:in => Bill.all.collect{|bill| bill.id}}
end

# == Schema Information
#
# Table name: items
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  price      :float
#  ledger_id  :integer
#  bill_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

