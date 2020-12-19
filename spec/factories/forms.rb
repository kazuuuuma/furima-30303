FactoryBot.define do
  factory :form do
    postalcode     { '123-1234' }
    prefecture_id  { 2 }
    municipality   { 'A市' }
    address        { '1-1-1'}
    phonenumber    { '12345678912' }
    token          {"tok_abcdefghijk00000000000000000"}
  end
end
