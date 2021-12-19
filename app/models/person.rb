class Person < ApplicationRecord
  belongs_to :organization
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_one_attached :avatar, dependent: :destroy
end
