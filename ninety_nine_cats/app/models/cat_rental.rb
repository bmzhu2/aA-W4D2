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

class CatRental < ApplicationRecord
    validates :cat_id, :start_date, :end_date, presence: true
    validates :status, inclusion: {in: %w('PENDING' 'APPROVED' 'DENIED')}

    belongs_to :cat,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :Cat,
        dependent: :destroy

    def overlapping_requests()
        CatRental.where("start_date BETWEEN ? AND ?", self.start_date, self.end_date )
    end
end
