require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'when it has correc data' do
    it 'saves' do
      result = Project.create(
        name:          'Caracas',
        description:   'Descripción del proyecto',
        beneficiaries: 10,
        address:       'Caracas, Venezuela'
        )

      expect(result).to be_valid
      expect(result.name).to          eq('Caracas')
      expect(result.description).to   eq('Descripción del proyecto')
      expect(result.beneficiaries).to eq(10)
      expect(result.address).to       eq('Caracas, Venezuela')
      expect(result.longitude).to     eq(10.4696404)
      expect(result.latitude).to      eq(-66.8037185)
    end
  end
end
