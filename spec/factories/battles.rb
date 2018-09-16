FactoryBot.define do
  factory :battle do
    my_rate { 1500 }
    opp_rate { 1500 }
    opp_name { 'レッド' }
    win { true }

    trait :with_pokes do
      after(:create) do |battle|
        my_poke0 = create(:サザンドラ, :with_latest_history, user: battle.user)
        my_poke1 = create(:ギルガルド, :with_latest_history, user: battle.user)
        my_poke2 = create(:マリルリ, :with_latest_history, user: battle.user)
        my_poke3 = create(:ファイアロー, :with_latest_history, user: battle.user)
        my_poke4 = create(:メガフシギバナ, :with_latest_history, user: battle.user)
        my_poke5 = create(:ガブリアス, :with_latest_history, user: battle.user)
        battle.battle_my_poke_histories.create(my_poke_history_id: my_poke1.latest_history.id, order: 1)
        battle.battle_my_poke_histories.create(my_poke_history_id: my_poke0.latest_history.id, order: 2)
        battle.battle_my_poke_histories.create(my_poke_history_id: my_poke2.latest_history.id, order: 3)
        battle.battle_my_poke_histories.create(my_poke_history_id: my_poke3.latest_history.id, order: 0)
        battle.battle_my_poke_histories.create(my_poke_history_id: my_poke4.latest_history.id, order: 0)
        battle.battle_my_poke_histories.create(my_poke_history_id: my_poke5.latest_history.id, order: 0)
        opp_poke0 = create(:相手_0, :with_moves, user: battle.user)
        opp_poke1 = create(:相手_1, :with_moves, user: battle.user)
        opp_poke2 = create(:相手_2, :with_moves, user: battle.user)
        opp_poke3 = create(:相手_控え_0, user: battle.user)
        opp_poke4 = create(:相手_控え_1, user: battle.user)
        opp_poke5 = create(:相手_控え_2, user: battle.user)
        battle.battle_opp_pokes.create(opp_poke_id: opp_poke0.id, order: 1)
        battle.battle_opp_pokes.create(opp_poke_id: opp_poke1.id, order: 2)
        battle.battle_opp_pokes.create(opp_poke_id: opp_poke2.id, order: 3)
        battle.battle_opp_pokes.create(opp_poke_id: opp_poke3.id, order: 0)
        battle.battle_opp_pokes.create(opp_poke_id: opp_poke4.id, order: 0)
        battle.battle_opp_pokes.create(opp_poke_id: opp_poke5.id, order: 0)
      end
    end
  end
end
