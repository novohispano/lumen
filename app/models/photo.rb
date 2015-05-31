class Photo < ActiveRecord::Base
  belongs_to :project
  
  has_attached_file :file,
                    styles: { large: '1280>x600' , medium: '300>x300', thumb: '50>x50' },
                    default_url: '/images/:style/missing.png'

  validates_attachment_content_type :file,
                                    content_type: /\Aimage\/.*\Z/
end
