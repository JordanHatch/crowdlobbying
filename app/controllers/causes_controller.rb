class CausesController < ApplicationController     
  before_filter :get_cause, :only => [:show, :edit, :update, :destroy]
  
  def index 
    @causes = Cause.order('created_at DESC').all
  end

  def show
    # cause found            
    @members = Member.order('last_name ASC, first_name ASC')
    
    @supporters = @cause.member_causes.where('average_rating > 0').order('average_rating DESC, report_count DESC').limit(5)
    @rebellers = @cause.member_causes.where('average_rating > 0').order('average_rating ASC, report_count DESC').limit(5)
  end

  def new              
    @cause = Cause.new
  end                 
  
  def create
    @cause = Cause.new(params[:cause])
                   
    if verify_recaptcha(:model => @cause, :timeout => 10, :message => "The verification code was incorrect") and @cause.save
      flash[:notice] = 'Cause has been created'
      redirect_to cause_url(@cause)
    else
      render :action => "new"
    end
  end

  def edit      
    # cause found
  end  
  
  def update
    
  end
  
  private
  def get_cause
    @cause = Cause.find params[:id]
  
    unless @cause.present?  
      flash[:error] = 'Cause could not be found.'
      redirect_to causes_url                    
      return
    end
  end

end
