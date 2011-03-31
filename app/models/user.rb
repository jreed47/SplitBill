class User < ActiveRecord::Base
  has_many :bills, :dependent => :destroy
  has_many :ledgers
end
