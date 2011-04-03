class Bill < ActiveRecord::Base
  belongs_to :user
  has_many :items, :dependent => :destroy

  validates :name,:location,:event_time,:user_id, :presence => true
end

# == Schema Information
#
# Table name: bills
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  receipt_loc :string(255)
#  event_time  :datetime
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

