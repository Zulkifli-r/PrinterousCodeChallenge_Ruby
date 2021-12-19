class Organization < ApplicationRecord
  PAGE_LIMIT = 6
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :phone, presence: true

  belongs_to :user, optional: true
  has_many :people, dependent: :destroy
  has_one_attached :logo, dependent: :destroy
  scope :latest, -> { order(id: :desc) }
  def self.search(query)
    if query.blank?
      all
    else
      where('organizations.name LIKE ?', "%#{query}%")
    end
  end
end
