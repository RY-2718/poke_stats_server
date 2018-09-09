require 'rails_helper'

RSpec.describe PokeDex, type: :model do
  let(:ガブリアス) { PokeDex.find_by(name: 'ガブリアス') }
  let(:ヒトカゲ) { PokeDex.find_by(name: 'ヒトカゲ') }

  describe '#base' do
    it 'should return correct hash' do
      expect(ガブリアス.base).to match(
        h: 108,
        a: 130,
        b: 95,
        c: 80,
        d: 85,
        s: 102,
      )
    end
  end

  describe '#types' do
    it 'should return types array' do
      expect(ガブリアス.types).to eq %w[ドラゴン じめん]
      expect(ヒトカゲ.types).to eq %w[ほのお]
    end
  end
end
