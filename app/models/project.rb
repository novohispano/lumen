class Project < ActiveRecord::Base
  has_many :photos

  validates :name,          presence: true, uniqueness: true
  validates :description,   presence: true
  validates :address,       presence: true
  validates :beneficiaries, numericality: { only_integer: true }

  before_validation :get_coordinates

  private

  def get_coordinates
    coordinates = GeocoderService.new.coordinates(address)

    self.longitude = coordinates[:latitude]
    self.latitude  = coordinates[:longitude]
  end
end
