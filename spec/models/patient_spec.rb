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

require 'rails_helper'

RSpec.describe Patient, type: :model do
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:middle_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:medical_record_number).of_type(:string) }
  it { should have_db_column(:date_of_birth).of_type(:date) }
  it { should have_db_column(:viewed_count).of_type(:integer) }

  it {should belong_to(:location)}
  it {should define_enum_for(:gender).with([:not_available, :male, :female])}
  it {should define_enum_for(:status).with([:initial, :referred, :treatment, :closed])}

  it_behaves_like 'a Paranoid model'

  it "should be error when first_name rather than 30" do
    patient = build(:patient, first_name: 'a'*31)
    expect(patient).to be_invalid
  end

  it "should be error when middle_name rather than 10" do
    patient = build(:patient, middle_name: 'a'*11)
    expect(patient).to be_invalid
  end

  it "should be error when last_name rather than 30" do
    patient = build(:patient, last_name: 'a'*31)
    expect(patient).to be_invalid
  end

  it "medical record number should be padded with 6 zeros with id " do
    patient = create(:patient)
    patient.reload
    expect(patient.medical_record_number).to eq ('%06d' % patient.id.to_s)
  end

  it "viewed_count should be 0 when create" do
    patient = create(:patient)
    patient.reload
    expect(patient.viewed_count).to eq 0
  end

  it "should have scope onTreatment where state equal treatment" do
    expect(Patient.onTreatment.to_sql).to include("`status` = #{Patient.statuses[:treatment]}")
  end


end
