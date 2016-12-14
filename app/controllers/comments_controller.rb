class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end

	def create
    event = Event.find(params[:event_id])
    user = User.find(session[:user_id])
    Comment.create(content: params[:comment], event: event, user: user )
    redirect_to "/events/#{params[:event_id]}"		
	end

	def destroy
	comment = Comment.find(params[:id])
	comment.destroy
	redirect_to "/events/#{params[:event_id]}"
	end
end
