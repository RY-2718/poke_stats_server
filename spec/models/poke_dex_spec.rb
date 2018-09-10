require 'rails_helper'

RSpec.describe PokeDex, type: :model do
  let(:ヒトカゲ) { PokeDex.find_by(name: 'ヒトカゲ') }
  let(:トランセル) { PokeDex.find_by(name: 'トランセル') }
  let(:ポッポ) { PokeDex.find_by(name: 'ポッポ') }
  let(:ガブリアス) { PokeDex.find_by(name: 'ガブリアス') }

  describe '#abilities' do
    it 'should return correct array' do
      expect(トランセル.abilities).to eq %w[だっぴ]
      expect(ガブリアス.abilities).to eq %w[すながくれ さめはだ]
      expect(ポッポ.abilities).to eq %w[するどいめ はとむね ちどりあし]
    end
  end

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
