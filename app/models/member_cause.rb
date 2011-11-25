class MemberCause < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :cause
  
  has_many :reports, :dependent => :destroy
              
  def formatted_average_rating
    sprintf("%.1f",average_rating)
  end
  
  def rating_class
    case average_rating
    when 1..4
      "red"
    when 4..7
      "yellow"
    when 7..10
      "green"
    end
  end 
  
  def rating_in_words
    case average_rating 
    when 0
      "neither for or against"
    when 0..2
      "strongly against"
    when 2..4.5
      "against"
    when 4.5..5.5
      "neither for or against"
    when 5.5..9
      "for"
    when 9..10
      "strongly for"
    end
  end
  
end
