FactoryBot.define do
  factory :サザンドラ_最新_0, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'あくのはどう').id }
  end

  factory :サザンドラ_最新_1, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'りゅうせいぐん').id }
  end

  factory :サザンドラ_最新_2, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'かえんほうしゃ').id }
  end

  factory :サザンドラ_最新_3, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'ハイパーボイス').id }
  end

  factory :ギルガルド_最新_0, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'シャドーボール').id }
  end

  factory :ギルガルド_最新_1, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'せいなるつるぎ').id }
  end

  factory :ギルガルド_最新_2, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'かげうち').id }
  end

  factory :ギルガルド_最新_3, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'キングシールド').id }
  end

  factory :マリルリ_最新_0, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'たきのぼり').id }
  end

  factory :マリルリ_最新_1, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'じゃれつく').id }
  end

  factory :マリルリ_最新_2, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'ばかぢから').id }
  end

  factory :マリルリ_最新_3, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'アクアジェット').id }
  end

  factory :ファイアロー_最新_0, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'ブレイブバード').id }
  end

  factory :ファイアロー_最新_1, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'おにび').id }
  end

  factory :ファイアロー_最新_2, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'ちょうはつ').id }
  end

  factory :ファイアロー_最新_3, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'はねやすめ').id }
  end

  factory :メガフシギバナ_最新_0, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'ヘドロばくだん').id }
  end

  factory :メガフシギバナ_最新_1, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'じしん').id }
  end

  factory :メガフシギバナ_最新_2, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'こうごうせい').id }
  end

  factory :メガフシギバナ_最新_3, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'のろい').id }
  end

  factory :ガブリアス_最新_0, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'じしん').id }
  end

  factory :ガブリアス_最新_1, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'げきりん').id }
  end

  factory :ガブリアス_最新_2, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'ストーンエッジ').id }
  end

  factory :ガブリアス_最新_3, class: MyPokeHistoryMove do
    move_id { Move.find_by(name: 'どくづき').id }
  end
end
