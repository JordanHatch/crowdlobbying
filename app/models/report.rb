class Report < ActiveRecord::Base                   
  
  belongs_to :member_cause, :counter_cache => :report_count
  belongs_to :member       
  
  after_save :calculate_member_cause_average
  
  validates :rating, :presence => true, :numericality => { :only_integer => true }    
  
  def rating_in_words
    case rating 
    when 0
      "neither for or against"
    when 1..2
      "strongly against"
    when 3..4
      "against"
    when 5
      "neither for or against"
    when 6..8
      "for"
    when 9..10
      "strongly for"
    end
  end
                 
  private
    def calculate_member_cause_average
      member_cause.update_attribute( :average_rating, member_cause.reports.average(:rating ) )
    end
  
end
