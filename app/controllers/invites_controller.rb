class InvitesController < ApplicationController
  def new
    @invite = Invite.new #initiate the instance
    @cycle = Cycle.find(params[:cycle_id]) #attribute cycle_id to the cycle
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @invite = Invite.new #initiate the instance
    @invite.cycle = Cycle.find(params[:cycle_id]) #interconnect the invite with each cycle and make cycle_id the params
    respond_to do |format|
      #added notices in case the post request failed
      if @invite.save
        format.html { redirect_to root_path, flash: {notice: "Invite successfully sent!" }} #redirects to root and provides a notice
      else
        format.html { redirect_to root_path, flash: {alert: "Invite failed!" }}
        format.js { render :action => 'new' } #for the stimulus js
      end
    end
  end

  private

  def invite_params
    params.require(:invites).permit(:email, :cycle_id, :message) #cycle_id seems to be unnecessary but I kept it
  end
end
