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
        redirect_to root_path, notice: "Your invite has been sent!"
      else
        format.json { render json: @invite}
      end
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :message)
  end
end
