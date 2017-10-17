FactoryGirl.define do
  factory :comment do
    sequence(:author) { |n| 'Author Name#{n}.' }
    sequence(:content) { |n| 'Content for comment#{n}' }
    category_id '1'
  end
end
