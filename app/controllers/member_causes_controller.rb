class MemberCausesController < ApplicationController
  def show           
    @cause = Cause.find(params[:cause_id])
    @member = Member.find(params[:id])
    @member_cause = @cause.member_causes.find_by_member_id(params[:id])
  end

end
