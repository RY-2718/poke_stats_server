FactoryBot.define do
  factory :サザンドラ_最新, class: MyPokeHistory do
    item { 'こだわりメガネ' }
    ability { 'ふゆう' }
    nature { 'ひかえめ' }
    effort_h { 0 }
    effort_a { 0 }
    effort_b { 0 }
    effort_c { 252 }
    effort_d { 4 }
    effort_s { 252 }
    individual_h { 31 }
    individual_a { 31 }
    individual_b { 31 }
    individual_c { 31 }
    individual_d { 31 }
    individual_s { 31 }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_3, my_poke_history: history)
      end
    end
  end

  factory :ギルガルド_最新, class: MyPokeHistory do
    item { 'じゃくてんほけん' }
    ability { 'バトルスイッチ' }
    nature { 'れいせい' }
    effort_h { 252 }
    effort_a { 0 }
    effort_b { 0 }
    effort_c { 252 }
    effort_d { 4 }
    effort_s { 0 }
    individual_h { 31 }
    individual_a { 31 }
    individual_b { 31 }
    individual_c { 31 }
    individual_d { 31 }
    individual_s { 0 }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:ギルガルド_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ギルガルド_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ギルガルド_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ギルガルド_最新_3, my_poke_history: history)
      end
    end
  end

  factory :マリルリ_最新, class: MyPokeHistory do
    item { 'ふうせん' }
    ability { 'ちからもち' }
    nature { 'いじっぱり' }
    effort_h { 252 }
    effort_a { 252 }
    effort_b { 0 }
    effort_c { 252 }
    effort_d { 4 }
    effort_s { 0 }
    individual_h { 31 }
    individual_a { 31 }
    individual_b { 31 }
    individual_c { 31 }
    individual_d { 31 }
    individual_s { 31 }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:マリルリ_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:マリルリ_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:マリルリ_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:マリルリ_最新_3, my_poke_history: history)
      end
    end
  end

  factory :ファイアロー_最新, class: MyPokeHistory do
    item { 'ゴツゴツメット' }
    ability { 'はやてのつばさ' }
    nature { 'ようき' }
    effort_h { 172 }
    effort_a { 0 }
    effort_b { 236 }
    effort_c { 0 }
    effort_d { 0 }
    effort_s { 100 }
    individual_h { 31 }
    individual_a { 31 }
    individual_b { 31 }
    individual_c { 31 }
    individual_d { 31 }
    individual_s { 31 }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:ファイアロー_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ファイアロー_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ファイアロー_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ファイアロー_最新_3, my_poke_history: history)
      end
    end
  end

  factory :メガフシギバナ_最新, class: MyPokeHistory do
    item { 'フシギバナイト' }
    ability { 'あついしぼう' }
    nature { 'なまいき' }
    effort_h { 252 }
    effort_a { 12 }
    effort_b { 84 }
    effort_c { 60 }
    effort_d { 100 }
    effort_s { 0 }
    individual_h { 31 }
    individual_a { 31 }
    individual_b { 31 }
    individual_c { 31 }
    individual_d { 31 }
    individual_s { 31 }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:メガフシギバナ_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:メガフシギバナ_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:メガフシギバナ_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:メガフシギバナ_最新_3, my_poke_history: history)
      end
    end
  end

  factory :ガブリアス_最新, class: MyPokeHistory do
    item { 'こだわりスカーフ' }
    ability { 'さめはだ' }
    nature { 'ようき' }
    effort_h { 0 }
    effort_a { 252 }
    effort_b { 0 }
    effort_c { 0 }
    effort_d { 4 }
    effort_s { 252 }
    individual_h { 31 }
    individual_a { 31 }
    individual_b { 31 }
    individual_c { 31 }
    individual_d { 31 }
    individual_s { 31 }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:ガブリアス_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ガブリアス_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ガブリアス_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:ガブリアス_最新_3, my_poke_history: history)
      end
    end
  end
end
