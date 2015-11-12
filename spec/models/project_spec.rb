require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:data) do
    {
      name:          'Caracas',
      description:   'Descripción del proyecto',
      beneficiaries: 10,
      address:       'Caracas, Venezuela',
      home:          true
    }
  end

  context 'when it has correct data' do
    it 'saves' do
      result = Project.create(data)

      expect(result).to be_valid
      expect(result.name).to          eq('Caracas')
      expect(result.description).to   eq('Descripción del proyecto')
      expect(result.beneficiaries).to eq(10)
      expect(result.address).to       eq('Caracas, Venezuela')
      expect(result.longitude).to     eq(-66.90360629999999)
      expect(result.latitude).to      eq(10.4805937)
    end
  end

  context 'when it has invalid data' do
    it 'doesn\'t allow more than three projects in home' do
      %w(Caracas1 Caracas2 Caracas3).each do |title|
        project_data        = data.dup
        project_data[:name] = title

        Project.create(project_data)
      end

      result = Project.create(data)

      expect(result).not_to                    be_valid
      expect(result.errors.messages[:home]).to include('no se pueden mostrar más de tres proyectos en la página de inicio')
    end
  end
end
