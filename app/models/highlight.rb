class Highlight < ActiveRecord::Base
  validates :title,        presence: true, uniqueness: true
  validates :description,  presence: true, length: { maximum: 500 }
  validates :content_type, inclusion: {
    in:      %w(metric history),
    message: "%{value} no es un tipo de contenido válido"
  }

  validate :metric_highlights
  validate :history_highlight

  scope :metrics, -> { where(content_type: 'metric')  }
  scope :history, -> { where(content_type: 'history') }

  def metric_highlights
    if Highlight.metrics.count > 3
      errors.add(:content_type, 'no se pueden mostrar más de tres métricas en la página de inicio')
    end
  end

  def history_highlight
    if Highlight.history.count > 1
      errors.add(:content_type, 'no se puede mostrar más de una historia en la página de inicio')
    end
  end
end
