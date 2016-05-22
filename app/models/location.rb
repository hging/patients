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

class Location < ActiveRecord::Base
  has_many :patients

  validates :code, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 80 }
end
