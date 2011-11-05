class CausesController < ApplicationController     
  before_filter :get_cause, :only => [:show, :edit, :update, :destroy]
  
  def index 
    @causes = Cause.all
  end

  def show
    # cause found            
    @members = Member.order('last_name ASC, first_name ASC')
  end

  def new              
    @cause = Cause.new
  end                 
  
  def create
    @cause = Cause.new(params[:cause])
    
    if @cause.save
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
