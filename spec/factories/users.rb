FactoryBot.define do
  factory :user do
    nickname                           {"test"}
    email                              {"test@example"}
    password                           {"aaa000"}
    password_confirmation              {"aaa000"}
    name_first                         {"さささささ"}
    name_second                        {"ききききき"}
    name_kana_first                    {"サササササ"}
    name_kana_second                   {"キキキキキ"}
    birthday                           {"1999-11-11"}
  end
end