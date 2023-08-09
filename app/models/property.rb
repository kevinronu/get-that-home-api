class Property < ApplicationRecord
  has_many_attached :images
  belongs_to :user, counter_cache: true
  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy

  validates :operation_type, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :property_type, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :area, presence: true

  enum operation_type: { rent: 0, sale: 1 }
  enum property_type: { apartment: 0, house: 1 }

  validate :validate_fields_based_on_operation_type
  validate :validate_image_attachments

  private

  def validate_fields_based_on_operation_type
    if operation_type == "sale"
      validate_price_for_sale
    elsif operation_type == "rent"
      validate_monthly_rent_for_rent
      validate_maintenance_for_rent
    end
  end

  def validate_price_for_sale
    errors.add(:price, "must be present for sale") if price.blank?
    errors.add(:price, "must be greater than zero") if price.present? && price <= 0
  end

  def validate_monthly_rent_for_rent
    errors.add(:monthly_rent, "must be present for rent") if monthly_rent.blank?
    return unless monthly_rent.present? && monthly_rent <= 0

    errors.add(:monthly_rent,
               "must be greater than zero")
  end

  def validate_maintenance_for_rent
    errors.add(:maintenance, "must be present for rent") if maintenance.blank?
    return unless maintenance.present? && maintenance <= 0

    errors.add(:maintenance,
               "must be greater than zero")
  end

  def validate_image_attachments
    images.each do |image|
      errors.add(:images, "must be image files") unless image.image?

      errors.add(:images, "must be less than 5MB") if image.blob.byte_size > 5.megabytes
    end
  end
end
