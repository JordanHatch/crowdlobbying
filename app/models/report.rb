class Report < ActiveRecord::Base                   
  
  belongs_to :member_cause
  belongs_to :member
  
end
