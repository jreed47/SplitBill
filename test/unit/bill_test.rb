require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

