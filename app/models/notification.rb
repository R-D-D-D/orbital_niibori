class Notification < ApplicationRecord

  validates :content,
    presence: true,
    length: { maximum: 200 }

  validates :user_id,
    presence: true,
    numericality: { only_integer: true }

  validates :user_type,
    presence: true

  validates :origin_type,
    presence: true

  validates :origin_id,
    presence: true,
    numericality: { only_integer: true}

  # Returns the post/message that created the notification
  def origin
    self.origin_type.constantize.find(self.origin_id)
  end

  # Returns the lesson where the notification was created
  def lesson
    origin.lesson if self.origin_type == 'Post'
    origin.post.lesson if self.origin_type == 'Message'
  end

end
