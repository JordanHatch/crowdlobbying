class Cause < ActiveRecord::Base  
  
  has_many :member_causes
  after_create :create_member_causes
  
  private
  def create_member_causes
    Member.find_each do |m|
      self.member_causes.create( :member => m )
    end
  end
  
end
