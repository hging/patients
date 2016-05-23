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

class Patient < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :location

  validates :first_name, length: { maximum: 30 }
  validates :middle_name, length: { maximum: 10 }
  validates :last_name, length: { maximum: 30 }

  enum gender: [:not_available, :male, :female]
  enum status: [:initial, :referred, :treatment, :closed]

  scope :onTreatment, -> {where(:status => statuses[:treatment])}

  after_create :set_medical_record_number

  private

  def set_medical_record_number
    self.medical_record_number = ('%06d' % id.to_s)
    save!
  end
end
