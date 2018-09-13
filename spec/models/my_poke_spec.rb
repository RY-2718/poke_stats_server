require 'rails_helper'

RSpec.describe MyPoke, type: :model do
  let(:alice) { create(:alice) }
  let(:poke) { create(:サザンドラ, :with_latest_history, user: alice) }

  it 'should be valid' do
    expect(poke).to be_valid
  end

  describe '#full_info' do
    it 'should have keys' do
      expect(poke.full_info).to match(
        id: poke.id,
        name: 'サザンドラ',
        item: 'こだわりメガネ',
        nature: 'ひかえめ',
        base: { h: 92, a: 105, b: 90, c: 125, d: 90, s: 98 },
        effort: { h: 0, a: 0, b: 0, c: 252, d: 4, s: 252 },
        individual: { h: 31, a: 31, b: 31, c: 31, d: 31, s: 31 },
        real: { h: 167, a: 112, b: 110, c: 194, d: 111, s: 150 },
        moves: %w[あくのはどう りゅうせいぐん かえんほうしゃ ハイパーボイス],
        types: %w[あく ドラゴン],
        memo: 'やっぱりゲーチスのイメージが強いな（ストーリー勢並の感想）',
      )
    end
  end

  describe '#needs_create_new_history' do
    context 'battleが行われていない場合' do
      it 'should return false' do
        expect(poke.needs_create_new_history).to eq false
      end
    end

    context 'battleが行われていた場合' do
      before do
        poke.updated_at = Time.zone.now + 1.minute
      end

      it 'should return true' do
        expect(poke.needs_create_new_history).to eq true
      end
    end
  end
end
