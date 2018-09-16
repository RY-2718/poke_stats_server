require 'rails_helper'

RSpec.describe Battle, type: :model do
  let(:alice) { create(:alice) }
  let(:battle) { create(:battle, :with_pokes, user: alice) }

  it 'should be valid' do
    expect(battle).to be_valid
  end
end
