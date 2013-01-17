class Location < ActiveRecord::Base
  attr_accessible :code, :name


  validates :name, :presence => true
  validates :code, :length => {:maximum => 10}
  validates :name, :length => {:maximum => 80}


  has_many :patients

end
