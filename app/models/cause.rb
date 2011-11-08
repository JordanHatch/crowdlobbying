class Cause < ActiveRecord::Base  
  
  has_many :member_causes, :dependent => :destroy
               
  before_create :create_friendly_url
  after_create :create_member_causes
  
  validates :title, :presence => true     
         
  def to_param
    "#{self.id}-#{self.friendly_url}"
  end
  
  private                           
  def create_friendly_url
    self.friendly_url = self.title.parameterize
  end
  
  def create_member_causes
    Member.find_each do |m|
      self.member_causes.create( :member => m )
    end
  end
  
end
