FactoryGirl.define do
  factory :post do
    sequence(:name) { |n| 'Post name#{n}.' }
    sequence(:content) { |n| 'Content for name#{n}' }
    category_id '1'
  end
end
