class EventsController < ApplicationController

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create!(event_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        format.js
      else
        format.js { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :date_range, :start, :end, :event_type_id);
    end

end
