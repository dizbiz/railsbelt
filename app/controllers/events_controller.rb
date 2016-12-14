class EventsController < ApplicationController
protect_from_forgery
	def index
		@in_state_events = Event.where(state: current_user.state).includes(:host, :users)
		@out_of_state_events = Event.where.not(state: current_user.state).includes(:host, :users, :state)
	end

	def create
		event = Event.create(
			event_params.merge({
				state: State.find(event_params[:state]),
				host: current_user
				})
			)
		redirect_to '/events'
	end

	def edit
    @event = Event.find(params[:id])
	end

	def update
		event = Event.find(params[:id])
		event.update(
			event_params.merge(
				state: State.find(event_params[:state])
			)
		)
		# event.update(name: event_params[:name], date: event_params[:date], city: event_params[:city], state: event_params[:state])
		redirect_to '/events'
	end

	def destroy
	event = Event.find(params[:id])
	event.destroy
	redirect_to "/events"
	end
	private
		def event_params
			params.require(:event).permit(:name, :date, :city, :state)
			
		end
end
