require 'rails_helper'

RSpec.describe Battle, type: :model do
  let(:alice) { create(:alice) }
  let(:battle) { create(:battle, :with_pokes, user: alice) }

  it 'should be valid' do
    expect(battle).to be_valid
  end

  it 'should return my_poke with suit history' do
    my_poke_with_history = battle.my_pokes.find { |p| p.name == 'サザンドラ' }
    expect(my_poke_with_history.history.item).to eq 'こだわりスカーフ'
    latest_history = my_poke_with_history.my_poke_histories.order(created_at: :desc).first
    expect(my_poke_with_history.history).not_to eq latest_history
  end
end
