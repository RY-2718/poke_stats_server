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
    memo { 'やっぱりゲーチスのイメージが強いな（ストーリー勢並の感想）' }

    trait :with_moves do
      after(:create) do |history|
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_0, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_1, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_2, my_poke_history: history)
        history.my_poke_history_moves << FactoryBot.create(:サザンドラ_最新_3, my_poke_history: history)
      end
    end
  end

  factory :サザンドラ_履歴1, class: MyPokeHistory do
    item { 'こだわりスカーフ' }
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
    memo { '履歴1' }

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
    memo { 'ギルガルド！！！！！！！！！！！！アニポケで見た（多分全員いる）' }

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
    memo { 'マリルリかわいい！！けどつよいからこわい' }

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
    memo { 'HBベースアローとか6世代の化石かよ' }

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
    memo { 'メガバナはずっといるな' }

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
    memo { 'スカガブはシンプルに強いな' }

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
