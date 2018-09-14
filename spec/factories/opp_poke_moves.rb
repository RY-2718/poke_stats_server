FactoryBot.define do
  factory :相手_0_0, class: OppPokeMove do
    move_id { Move.find_by(name: 'ねこだまし').id }
  end

  factory :相手_0_1, class: OppPokeMove do
    move_id { Move.find_by(name: 'すてみタックル').id }
  end

  factory :相手_0_2, class: OppPokeMove do
    move_id { Move.find_by(name: 'じしん').id }
  end

  factory :相手_0_3, class: OppPokeMove do
    move_id { Move.find_by(name: 'れいとうビーム').id }
  end

  factory :相手_1_0, class: OppPokeMove do
    move_id { Move.find_by(name: 'じしん').id }
  end

  factory :相手_1_1, class: OppPokeMove do
    move_id { Move.find_by(name: 'いわなだれ').id }
  end

  factory :相手_1_2, class: OppPokeMove do
    move_id { Move.find_by(name: 'とんぼがえり').id }
  end

  factory :相手_2_0, class: OppPokeMove do
    move_id { Move.find_by(name: 'ムーンフォース').id }
  end
end
