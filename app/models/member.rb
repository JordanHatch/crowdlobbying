class Member < ActiveRecord::Base             
  belongs_to :party
  
  has_many :member_causes, :dependent => :destroy
  has_many :reports, :through => :member_causes      
  
  def full_name
    first_name + " " + last_name
  end
end
