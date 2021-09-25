FactoryBot.define do
  factory :order_residence do
    postal_code { '123-4567' }
    item_prefecture_id { 5 }
    city { '宇都宮' }
    addresses { '戸祭4-10' }
    building { 'フレンドリー' }
    phone_number { '09031741424' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id {FactoryBot.create(:user)}
    item_id {FactoryBot.create(:item)}

  end

end
