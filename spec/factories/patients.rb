# == Schema Information
#
# Table name: patients
#
#  id                    :integer          not null, primary key
#  first_name            :string(255)
#  middle_name           :string(255)
#  last_name             :string(255)
#  medical_record_number :string(255)
#  date_of_birth         :date
#  gender                :integer
#  status                :integer
#  location_id           :integer
#  viewed_count          :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  deleted_at            :datetime
#

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
