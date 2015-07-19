class News < ActiveRecord::Base
  validates :title,  presence: true, uniqueness: true, length: { maximum: 200 }
  validates :body,   presence: true
  validates :author, presence: true

  scope :recent, -> { last(10) }

  def intro
    body.gsub('\r\n\r\n', ' ').first(300) << '...'
  end
end
