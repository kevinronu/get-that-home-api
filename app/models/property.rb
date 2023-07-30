class Property < ApplicationRecord
  has_many_attached :images
  belongs_to :user, counter_cache: true

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

  def validate_fields_based_on_operation_type
    if operation_type == "sale"
      errors.add(:price, "must be present for sale") if price.blank?
    elsif operation_type == "rent"
      errors.add(:monthly_rent, "must be present for rent") if monthly_rent.blank?
      errors.add(:maintenance, "must be present for rent") if maintenance.blank?
    end
  end
end
