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
    @invite = Invite.new(invite_params)
    @invite.cycle = Cycle.find(params[:cycle_id])
    respond_to do |format|
      if @invite.save
        redirect_to cycles_path
      else
        redirect_to cycles_path
      end
    end
  end

  private

  def invite_params
    params.permit(:email, :cycle_id, :message)
  end
end
