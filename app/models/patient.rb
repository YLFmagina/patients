class Patient < ActiveRecord::Base
  attr_accessible :birthday, :first_name, :gender, :isdelete, :last_name, :location_id, :middle_name, :status, :viewed_count
  belongs_to :location
  validates :first_name, :last_name, :status, :location_id, :presence => true
  validates_length_of :first_name, :maximum => 30, :message => "Are you sure the length of your first name?"
  validates_length_of :middle_name, :maximum => 10, :message => "Are you sure the length of your middle name?"
  validates_length_of :last_name, :maximum => 30, :message => "Are you sure the length of your last name?"

  scope :onTreatment,  where(:status => 'Treatment', :isdelete => 0)

  scope :isExist, where(:isdelete => 0)

  def self.fullname(patient)
    [patient.first_name, patient.middle_name, patient.last_name].join(" ")
  end

  def self.mr_number(patient)
  	"MR0000" + patient.id.to_s()
  end

end
