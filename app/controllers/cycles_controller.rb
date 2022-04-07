class CyclesController < ApplicationController
  def index
    #@cycles = Cycle.all
    #A simple SQL query to only show the entries where public_status was true
    @cycles = Cycle.where(public_status: true)
  end
end
