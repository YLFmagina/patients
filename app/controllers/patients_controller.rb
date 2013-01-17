class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    if Location.all.any?
      puts "Data exit!"
    else
      location1 = Location.new(:code => "00001", :name => "Test localtion 1")
      location2 = Location.new(:code => "00002", :name => "Test localtion 2")
      location1.save
      location2.save
    end
    @patients = Patient.isExist

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
    @patient.viewed_count += 1
    @patient.save

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])
    @patient.viewed_count = 0
    @patient.isdelete = 0

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { render action: "new" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.isdelete = 1
    @patient.save

    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end


   # Get /patients/ontreatment
  def ontreatment
    @patients = Patient.onTreatment

    respond_to do |format|
      format.html 
    end
  end

end
