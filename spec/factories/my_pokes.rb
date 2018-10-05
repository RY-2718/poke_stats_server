FactoryBot.define do
  factory :サザンドラ, class: MyPoke do
    poke_dex_id { PokeDex.find_by(name: 'サザンドラ').id }

    trait :with_latest_history do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:サザンドラ_最新, :with_moves, my_poke: poke)
      end
    end

    trait :with_histories do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:サザンドラ_履歴1, :with_moves, my_poke: poke, created_at: Time.zone.now - 1.minute)
        poke.my_poke_histories << FactoryBot.create(:サザンドラ_最新, :with_moves, my_poke: poke)
      end
    end
  end

  factory :ギルガルド, class: MyPoke do
    poke_dex_id { PokeDex.find_by(name: 'ギルガルド').id }

    trait :with_latest_history do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:ギルガルド_最新, :with_moves, my_poke: poke)
      end
    end
  end

  factory :マリルリ, class: MyPoke do
    poke_dex_id { PokeDex.find_by(name: 'マリルリ').id }

    trait :with_latest_history do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:マリルリ_最新, :with_moves, my_poke: poke)
      end
    end
  end

  factory :ファイアロー, class: MyPoke do
    poke_dex_id { PokeDex.find_by(name: 'ファイアロー').id }

    trait :with_latest_history do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:ファイアロー_最新, :with_moves, my_poke: poke)
      end
    end
  end

  factory :メガフシギバナ, class: MyPoke do
    poke_dex_id { PokeDex.find_by(name: 'メガフシギバナ').id }

    trait :with_latest_history do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:メガフシギバナ_最新, :with_moves, my_poke: poke)
      end
    end
  end

  factory :ガブリアス, class: MyPoke do
    poke_dex_id { PokeDex.find_by(name: 'ガブリアス').id }

    trait :with_latest_history do
      after(:create) do |poke|
        poke.my_poke_histories << FactoryBot.create(:ガブリアス_最新, :with_moves, my_poke: poke)
      end
    end
  end
end
