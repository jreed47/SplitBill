require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

