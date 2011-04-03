require 'test_helper'

class LedgerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

