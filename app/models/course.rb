class Course < ApplicationRecord
  belongs_to :tutor
  validates :title, presence: true
  validates :content, presence: true

end
