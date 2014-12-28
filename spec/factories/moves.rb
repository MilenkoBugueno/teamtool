# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :move do
    title "MyString"
    description "MyText"
    results "MyText"
    start_date "2014-12-28 07:50:00"
    end_date "2014-12-28 07:50:00"
    user_id 1
    project_id 1
    category_id 1
    inscription_id 1
    container_id 1
  end
end
