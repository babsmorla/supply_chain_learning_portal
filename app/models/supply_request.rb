class SupplyRequest < ApplicationRecord
  belongs_to :user
  has_many :audit_logs, as: :auditable, dependent: :destroy

  belongs_to :approved_by,
           class_name: "User",
           optional: true

  STATUSES = %w[pending approved rejected fulfilled].freeze

  validates :item_name, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :reason, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  after_initialize :set_default_status, if: :new_record?



private

    def set_default_status
      self.status ||= "pending"
    end
end
