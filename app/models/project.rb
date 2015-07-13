class Project < ActiveRecord::Base
  has_many :photos

  validates :name,          presence: true, uniqueness: true
  validates :description,   presence: true
  validates :address,       presence: true
  validates :beneficiaries, numericality: { only_integer: true }

  validate :projects_in_home

  before_validation :get_coordinates

  scope :home, -> { where(home: true) }

  private

  def get_coordinates
    coordinates = GeocoderService.new.coordinates(address)

    self.longitude = coordinates[:latitude]
    self.latitude  = coordinates[:longitude]
  end

  def projects_in_home
    if Project.count > 3
      errors.add(:home, 'no se pueden mostrar más de tres proyectos en la página de inicio')
    end
  end
end
