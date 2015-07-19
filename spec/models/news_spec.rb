require 'rails_helper'

RSpec.describe News, type: :model do
  let(:data) do
    {
      title:  'Título',
      body:   'Texto',
      author: 'Martín Guzmán'
    }
  end

  context 'when it has correct data' do
    it 'saves' do
      result = News.create(data)

      expect(result).to        be_valid
      expect(result.title).to  eq 'Título'
      expect(result.body).to   eq 'Texto'
      expect(result.author).to eq 'Martín Guzmán'
    end

    it 'does not save when it has the same title' do
      News.create(data)
      result = News.create(data)

      expect(result).not_to be_valid
    end

    it 'does not save when it has a title longer than 200 characters' do
      result       = News.create(data)
      result.title = result.title.ljust(201)

      expect(result).not_to be_valid
    end

    it 'returns the last 10 records' do
      11.times do |i|
        News.create(
          title:  "Título #{i}",
          body:   'Texto',
          author: 'Martín Guzmán'
          )
      end

      result = News.recent

      expect(result.count).to eq 10
    end
  end
end
