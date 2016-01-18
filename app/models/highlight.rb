class Highlight < ActiveRecord::Base
  validates :title,        presence: true, uniqueness: true
  validates :description,  presence: true, length: { maximum: 500 }
  validates :content_type, inclusion: {
    in:      %w(metric history),
    message: "%{value} no es un tipo de contenido válido"
  }

  validate :metric_highlight_creation,  on: :create
  validate :history_highlight_creation, on: :create

  scope :metrics, -> { where(content_type: 'metric')  }
  scope :history, -> { where(content_type: 'history') }

  def history?
    content_type == 'history'
  end

  def metric?
    content_type == 'metric'
  end

  private

  def metric_highlight_creation
    if Highlight.metrics.count >= 3 && metric?
      errors.add(:content_type, 'no se pueden mostrar más de tres métricas en la página de inicio')
    end
  end

  def history_highlight_creation
    if Highlight.history.count >= 1 && history?
      errors.add(:content_type, 'no se puede mostrar más de una historia en la página de inicio')
    end
  end
end
