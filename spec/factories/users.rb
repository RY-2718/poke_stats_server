FactoryBot.define do
  factory :alice, class: User do
    username { 'Alice' }
    google_uid { 1234567890 }
  end
end
