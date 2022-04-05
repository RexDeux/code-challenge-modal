class CyclesController < ApplicationController
  def index
<<<<<<< HEAD
    #@cycles = Cycle.all
    #A simple SQL query to only show the entries where public_status was true
    @cycles = Cycle.where(public_status: true)
=======
    #cycles = Cycle.all
    #A simple SQL query to only show the entries where public_status was true
    @cycles = Cycle.where(public_status: true)
    @invite = Invite.new
  end
  def new
    @cycle = Cycle.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cycle }
    end
>>>>>>> beb07971280fb3e5b839e1a2d56fbb39ea1879ec
  end
end
