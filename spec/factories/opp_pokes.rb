FactoryBot.define do
  factory :相手_0, class: OppPoke do
    poke_dex_id { PokeDex.find_by(name: 'メガガルーラ').id }
    ability { 'おやこあい' }
    item { 'ガルーラナイト' }
    memo { 'まだいるのこいつ' }
    nature { 'むじゃき' }

    trait :with_moves do
      after(:create) do |poke|
        poke.opp_poke_moves << FactoryBot.create(:相手_0_0, opp_poke: poke)
        poke.opp_poke_moves << FactoryBot.create(:相手_0_1, opp_poke: poke)
        poke.opp_poke_moves << FactoryBot.create(:相手_0_2, opp_poke: poke)
        poke.opp_poke_moves << FactoryBot.create(:相手_0_3, opp_poke: poke)
      end
    end
  end

  factory :相手_1, class: OppPoke do
    poke_dex_id { PokeDex.find_by(name: 'ランドロス(けしんフォルム)').id }
    ability { 'いかく' }
    item { 'こだわりスカーフ' }
    nature { 'ようき' }

    trait :with_moves do
      after(:create) do |poke|
        poke.opp_poke_moves << FactoryBot.create(:相手_1_0, opp_poke: poke)
        poke.opp_poke_moves << FactoryBot.create(:相手_1_1, opp_poke: poke)
        poke.opp_poke_moves << FactoryBot.create(:相手_1_2, opp_poke: poke)
      end
    end
  end

  factory :相手_2, class: OppPoke do
    poke_dex_id { PokeDex.find_by(name: 'カプ・レヒレ').id }
    ability { 'ミストメイカー' }
    item { 'オボンのみ' }

    trait :with_moves do
      after(:create) do |poke|
        poke.opp_poke_moves << FactoryBot.create(:相手_2_0, opp_poke: poke)
      end
    end
  end

  factory :相手_控え_0, class: OppPoke do
    poke_dex_id { PokeDex.find_by(name: 'ギルガルド').id }
  end

  factory :相手_控え_1, class: OppPoke do
    poke_dex_id { PokeDex.find_by(name: 'ウルガモス').id }
  end

  factory :相手_控え_2, class: OppPoke do
    poke_dex_id { PokeDex.find_by(name: 'ミミッキュ').id }
  end
end
