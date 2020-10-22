FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000aaa"}
    password_confirmation {password}
    first_name            {"佐藤"}
    last_name             {"太郎"}
    first_name_kana       {"サトウ"}
    last_name_kana        {"タロウ"}
    # birthday              {2000/01/01}
  end
end