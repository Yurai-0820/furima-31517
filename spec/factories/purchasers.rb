FactoryBot.define do
  factory :order_cash do
    postal_code    { '123-4567' }
    prefecture_id  { 1 }
    municipality   { 'あああ' }
    address        { 'あああ' }
    building_name  { 'あああ' }
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }

  end
end
