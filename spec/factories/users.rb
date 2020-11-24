FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@kkk"}
    password              {"000000"}
    password_confirmation {"000000"}
    family_name             {"ひらがな"}
    fam_name_furigana        {"カタカナ"}
    first_name            {"漢字"}
    fst_name_furigana       {"カタカナ"}
    birthday             {"2020-01-01"}
  end
end
