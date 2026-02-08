class Discount < ApplicationRecord
    include ImageUploader::Attachment(:image)    #connect to shrine uploader
    has_rich_text :description #actiontext handles the description field as rich text now 
    validates :title , presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :expiration_date, presence: true
    validate :expiration_must_be_30_days_away
    validates :image, presence: true
    
    private
    def expiration_must_be_30_days_away
    if expiration_date.present? && expiration_date < 30.days.from_now.to_date
      errors.add(:expiration_date, "must be at least 30 days in the future")
    end
  end
end
