class Discount < ApplicationRecord
    validates :title , presence: true
    validates :email, presence: true
    validates :expiration_date, presence: true
    validate :expiration_must_be_30_days_away
    private
    def expiration_must_be_30_days_away
    if expiration_date.present? && expiration_date < 30.days.from_now.to_date
      errors.add(:expiration_date, "must be at least 30 days in the future")
    end
  end
end
