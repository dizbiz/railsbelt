class SessionsController < ApplicationController
# protect_from_forgery
	def new
		@states = State.all
	end

	def create
		user = User.find_by(email: login_params[:email])
		if user && user.authenticate(login_params[:password])
			session[:user_id] = user.id
			redirect_to '/events'
		else
			flash[:errors] = ['Invalid credentials.']
			redirect_to '/sessions/new'
		end
		
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/'
	end

	private
		def login_params
			params.require(:login).permit(:email, :password)
			
		end
end
