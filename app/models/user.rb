class User < ActiveRecord::Base
  has_many :bills
  has_many :items, :through => :bills
end
