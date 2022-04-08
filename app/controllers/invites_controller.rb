class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @cycle = Cycle.find(params[:cycle_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @invite = Invite.new
    @invite.cycle = Cycle.find(params[:cycle_id])
    respond_to do |format|
      #added notices in case the post request failed
      if @invite.save
        format.html { redirect_to root_path, flash: {notice: "Invite successfully sent!" }}
      else
        format.html { redirect_to root_path, flash: {alert: "Invite failed!" }}
      end
    end
  end

  private

  def invite_params
    params.require(:invites).permit(:email, :cycle_id, :message)
  end
end
