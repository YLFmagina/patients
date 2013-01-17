require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	test "Patient attributes must not be empty" do
		patient	= Patient.new
		assert patient.invalid?
		assert patient.errors[:first_name].any?
		assert patient.errors[:last_name].any?
		assert patient.errors[:status].any?
		assert patient.errors[:location_id].any?
	end

	def new_patient(name)
		Patient.new(:first_name => name,
					:last_name => name,
					:status => "Treatment",
					:location_id => 1)
	end

	test "first nad last name length" do
		ok = %w{make lili frank jim cobertura }
		bad = %w{bad jack aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb}
		ok.each do |name|
			assert new_patient(name).valid?,"#{name} shouldn't be invalid"
		end

		bad.each do |name|
			assert new_patient(name).valid?,"#{name} shouldn't be valid"
		end
	end

	test "patient index show record not deleted " do 
		patientexist = Patient.new(:first_name => name,
					:last_name => name,
					:status => "Treatment",
					:location_id => 1,
					:isdelete => 0)
		patientdelete = Patient.new(:first_name => name,
					:last_name => name,
					:status => "Treatment",
					:location_id => 1,
					:isdelete => 1)
end
