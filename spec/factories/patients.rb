FactoryGirl.define do
  factory :patient do
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    medical_record_number "MyString"
    date_of_birth "2016-05-22"
    gender 1
    status 1
    location nil
    viewed_count 1
  end
end
