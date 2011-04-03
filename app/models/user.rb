class User < ActiveRecord::Base
  has_many :bills, :dependent => :destroy
  has_many :ledgers

  validates :name, :presence => true
end

# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

