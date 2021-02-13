FactoryBot.define do
  factory :user do
    id                                 { Faker::Number.unique.number(1) }
    nickname                           { Faker::Name.initials(number: 6) }
    email                              { Faker::Internet.free_email }
    password                           { Faker::Internet.password(min_length: 6) }
    password_confirmation              { password }
    name_first                         { Gimei.first.kanji }
    name_second                        { Gimei.last.kanji }
    name_kana_first                    { Gimei.first.katakana }
    name_kana_second                   { Gimei.last.katakana }
    birthday                           { '1999-11-11' }
  end
end
