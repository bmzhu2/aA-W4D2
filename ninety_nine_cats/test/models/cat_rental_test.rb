# == Schema Information
#
# Table name: cat_rentals
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CatRentalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
