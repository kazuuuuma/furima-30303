FactoryBot.define do
  factory :form do
    postalcode     { '123-1234' }
    prefecture_id  { 2 }
    municipality   { 'A市' }
    address        { '1-1-1'}
    build          { 'A'}
    phonenumber    { '12345678912' }
    user_id        { 1 }
    item_id        { 1 }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
