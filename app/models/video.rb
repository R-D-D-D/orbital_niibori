class Video < ApplicationRecord
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  YOUTUBE_REGEX = %r(^(http[s]*:\/\/)?(www.)?(youtube.com|youtu.be)\/(watch\?v=){0,1}([a-zA-Z0-9_-]{11}))
  validates :link, presence: true, format: YT_LINK_FORMAT
  before_save :update_attr

  private

  def update_attr
    id = find_youtube_id(link)
    video = Yt::Video.new id: id
    self.uid = id
    self.title = video.title.to_s
    self.likes = video.like_count
    self.dislikes = video.dislike_count
    self.published_at = video.published_at
  end

  def find_youtube_id(url)
    matches = YOUTUBE_REGEX.match url.to_str
    if matches
      matches[6] || matches[5]
    end
  end
end
