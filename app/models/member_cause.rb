class MemberCause < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :cause
  
  has_many :reports
  
  def rating_class
    case average_rating
    when 1..4
      "red"
    when 5..7
      "yellow"
    when 8..10
      "green"
    end
  end 
  
  def rating_in_words
    case average_rating 
    when 0
      "neither for or against"
    when 1..2
      "strongly against"
    when 3..4
      "against"
    when 5
      "neither for or against"
    when 6..7
      "for"
    when 8..10
      "strongly for"
    end
  end
  
end
