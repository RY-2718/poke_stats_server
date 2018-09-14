require 'rails_helper'

RSpec.describe OppPoke, type: :model do
  let(:alice) { create(:alice) }
  let(:poke) { create(:相手_0, :with_moves, user: alice) }
  let(:poke1) { create(:相手_1, :with_moves, user: alice) }
  let(:poke2) { create(:相手_2, :with_moves, user: alice) }
  let(:poke3) { create(:相手_控え_0, user: alice) }
  let(:poke4) { create(:相手_控え_1, user: alice) }
  let(:poke5) { create(:相手_控え_2, user: alice) }

  it 'should be valid' do
    expect(poke).to be_valid
    expect(poke1).to be_valid
    expect(poke2).to be_valid
    expect(poke3).to be_valid
    expect(poke4).to be_valid
    expect(poke5).to be_valid
  end

  describe '#full_info' do
    it 'should have keys' do
      expect(poke.full_info).to match(
        id: poke.id,
        name: 'メガガルーラ',
        base: { h: 105, a: 125, b: 100, c: 60, d: 100, s: 100 },
        types: %w[ノーマル],
        ability: 'おやこあい',
        item: 'ガルーラナイト',
        nature: 'むじゃき',
        memo: 'まだいるのこいつ',
        moves: %w[ねこだまし すてみタックル じしん れいとうビーム],
      )
    end
  end
end
