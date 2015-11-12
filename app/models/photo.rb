class Photo < ActiveRecord::Base
  extend ActionView::Helpers::AssetUrlHelper

  belongs_to :project

  has_attached_file :file,
                    styles: { large: '1280>x600' , medium: '300>x300', thumb: '50>x50' },
                    default_url: image_url('photo_placeholder.png')

  validates_attachment_content_type :file,
                                    content_type: /\Aimage\/.*\Z/

  validates :description,
            presence: true,
            length: { maximum: 200 }

  default_scope { order(created_at: :desc) }

  scope :slider, -> { where(slider: true) }

  process_in_background :file, processing_image_url: image_url('photo_placeholder.png')
end
