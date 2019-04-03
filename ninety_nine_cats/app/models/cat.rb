# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
    COLORS = Set.new(['orange', 'white', 'black', 'brown'])

    validates :color, inclusion: {in: COLORS}
    validates :sex, inclusion: {in: %w(M F)} # does this work?

    has_many :rentals,
        primary_key: :id,
        foreign_key: :cat_id,
        class_name: :CatRental

    def age
        now = Time.now
        current_date = {year: now.year, mon: now.month, mday: now.day}
        birth_date = Date._parse(self.birth_date.to_s)

        diff_year = current_date[:year] - birth_date[:year]
        diff_month = current_date[:mon] - birth_date[:mon]
        diff_day = current_date[:mday] - birth_date[:mday]
        diff_month -= 1 if diff_day < 0
        diff_year -= 1 if diff_month < 0
        diff_year
    end
end
