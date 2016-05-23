class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  def index
    location = Location.find_by(:id => params[:location_id])
    @patients = location.try(:patients) || Patient.all
  end

  def new
    @patient ||= Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: t('.notice')
    else
      render :new
    end
  end

  def show
    @patient.viewed
  end

  def edit
  end

  def update
    if @patient.update_attributes(patient_params)
      redirect_to @patient, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: t('.notice')
  end

  private
  def set_patient
    @patient = Patient.find_by params[:id]
  end

  def patient_params
    params.require(:patient).permit(:first_name, :middle_name, :last_name, :date_of_birth, :gender, :status, :location_id)
  end
end
