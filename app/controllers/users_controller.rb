class UsersController < ApplicationController
	def create
		user = User.new(user_params.merge({state: State.find(user_params[:state])}))
		if user.save
			session[:user_id] = user.id
			redirect_to '/events'
		else
			flash[:errors] = user.errors.full_messages
			redirect_to '/sessions/new'	
		end
	end

	def edit
    @states = get_states
    @user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.update(
			user_params.merge(
				state: State.find(user_params[:state])
			)
		)
		# event.update(name: event_params[:name], date: event_params[:date], city: event_params[:city], state: event_params[:state])
		redirect_to '/events'
	end
	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
			
		end
end
