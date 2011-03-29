class Item < ActiveRecord::Base
  belongs_to :bill
  belongs_to :user
end
