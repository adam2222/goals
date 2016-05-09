FactoryGirl.define do
  factory :user do # The name matters. :cat factory returns a Cat object.
    username  'Fluffy'
    password 'kitty500'
  end
end
