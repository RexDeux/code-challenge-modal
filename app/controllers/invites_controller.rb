class InvitesController < ApplicationController
  def create
    @invite = Invite.new(invite_params)
  end
  def update
    @invite = Invite.find(params[:id])
    if @invite.update_attributes(params[:invite])
        print"Invite Sent!"
    else
        print"Please try again later!"
    end
  end
  private
  def invite_params
    params.require(:invite).permit(:email,:message)
  end
end
