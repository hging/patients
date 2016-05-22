# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :location do
    code "MyString"
    name "MyString"
  end
end
