class InvitesController < ApplicationController
  def new
    @invite = Invite.new
    @cycle = Cycle.find(params[:cycle_id])
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @invite = Invite.new
    @invite.cycle = Cycle.find(params[:cycle_id])
    respond_to do |format|
      if @invite.save
        redirect_to cycles_path, :flash => { :message => "Invite sent!" }
      else
        redirect_to cycles_path, :flash => { :error => "Failed to send invite!" }
      end
    end
  end

  private

  def invite_params
    params.require(:invites).permit(:email, :cycle_id, :message)
  end
end
