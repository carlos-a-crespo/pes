class EventTypesController < ApplicationController

  def index
    respond_to do |format|
      format.json  { render :json => EventType.all.order(:name) }
    end
  end

end
