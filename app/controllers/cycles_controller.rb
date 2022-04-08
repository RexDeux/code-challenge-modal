class CyclesController < ApplicationController
  def index
    #cycles = Cycle.all
    #A simple SQL query to only show the entries where public_status was true
    @cycles = Cycle.where(public_status: true)
    @invite = Invite.new
  end

  #I was actually going to delete this method but as it stands after sending the invitation the routes lead back to it
  def new
    @cycle = Cycle.new
    @invite.cycle = Cycle.find(params[:cycle_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cycle }
    end
  end
end
