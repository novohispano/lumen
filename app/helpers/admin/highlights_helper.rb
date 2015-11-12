module Admin::HighlightsHelper
  def translate_highlight(content_type)
    return 'MÉTRICA'  if content_type == 'metric'
    return 'HISTORIA' if content_type == 'history'
  end
end
