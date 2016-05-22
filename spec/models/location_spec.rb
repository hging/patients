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

require 'rails_helper'

RSpec.describe Location, type: :model do

  it { should have_many(:patients) }

  describe "when location is wrong" do
    it "should be error when name is blank" do
      location = Location.new
      expect(location).to be_invalid
    end

    it "shold be error when name is rather than 80" do
      location = build(:location, name: 'a' * 81 )
      expect(location).to be_invalid
    end

    it "shold be error when code is rather than 10" do
      location = build(:location, code: 'a' * 11 )
      expect(location).to be_invalid
    end

    it "should be success" do
      location = build(:location)
      expect(location).to be_valid
    end

  end
end
