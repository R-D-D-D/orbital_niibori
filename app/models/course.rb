class Course < ApplicationRecord
  belongs_to :tutor
  has_many :subscriptions, dependent: :destroy
  has_many :students, through: :subscriptions, source: :student
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
end
