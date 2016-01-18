require 'rails_helper'

RSpec.describe Highlight, type: :model do
  let(:data) do
    {
      title:         'Highlight',
      description:   'Descripción del contenido',
      content_type:  'metric'
    }
  end

  context 'when it has correct data' do
    it 'saves' do
      result = Highlight.create(data)

      expect(result).to be_valid
      expect(result.title).to        eq('Highlight')
      expect(result.description).to  eq('Descripción del contenido')
      expect(result.content_type).to eq('metric')
    end
  end

  context 'when it has invalid data' do
    it 'doesn\'t allow more than three metrics in home' do
      %w(Hightlight1 Hightlight2 Hightlight3).each do |title|
        hightlight_data         = data.dup
        hightlight_data[:title] = title

        Highlight.create(hightlight_data)
      end

      result = Highlight.create(data)

      expect(result).not_to                            be_valid
      expect(result.errors.messages[:content_type]).to include('no se pueden mostrar más de tres métricas en la página de inicio')
    end
  end

  it 'doesn\'t allow more than one history in home' do
    result = nil

    %w(Hightlight1 Hightlight2).each do |title|
      hightlight_data                = data.dup
      hightlight_data[:content_type] = 'history'
      hightlight_data[:title]        = title

      result = Highlight.create(hightlight_data)
    end

    expect(result).not_to                            be_valid
    expect(result.errors.messages[:content_type]).to include('no se puede mostrar más de una historia en la página de inicio')
  end

  it 'allows to update a metric when there are three metrics' do
    %w(Hightlight1 Hightlight2 Hightlight3).each do |title|
      hightlight_data         = data.dup
      hightlight_data[:title] = title

      Highlight.create(hightlight_data)
    end

    result = Highlight.first
    result.update_attributes(title: 'Updated Highlight')

    expect(result).to       be_valid
    expect(result.title).to eq 'Updated Highlight'
  end

  it 'allows to update a metric when there are three metrics' do
    Highlight.create(title: 'History Highlight', description: 'Hightlight description', content_type: 'history')

    result = Highlight.first
    result.update_attributes(title: 'Updated Highlight')

    expect(result).to       be_valid
    expect(result.title).to eq 'Updated Highlight'
  end

  it 'doesn\'t allow content_type different from "metric" or "history"' do
    hightlight_data                = data.dup
    hightlight_data[:content_type] = 'arepa'

    result = Highlight.create(hightlight_data)

    expect(result).not_to                            be_valid
    expect(result.errors.messages[:content_type]).to include('arepa no es un tipo de contenido válido')
  end
end
