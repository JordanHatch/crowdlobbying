class ReportsController < ApplicationController
  before_filter :get_cause
  
  def new   
    @report = @member_cause.reports.build 
  end                                                
  
  def create
    @report = @member_cause.reports.build(params[:report])
    
    if verify_recaptcha(:model => @report, :message => "The verification code was incorrect") && @report.save
      flash[:notice] = 'Your report has been added.'
      redirect_to cause_member_url(@cause, @member)
    else
      render :action => :new
    end
  end

  def edit                               
    @report = @member_cause.reports.find(params[:id])
  end
  
  def update
    @report = @member_cause.reports.find(params[:id])
    
    if @report.update_attributes(params[:report])
      flash[:notice] = 'Your report has been saved.'
      redirect_to cause_member_url(@cause, @member)
    else
      render :action => :edit
    end
  end                     
  
  private
  def get_cause
    @cause = Cause.find(params[:cause_id])
    @member = Member.find(params[:member_id])
    @member_cause = @cause.member_causes.find_by_member_id(params[:member_id])
  end

end
