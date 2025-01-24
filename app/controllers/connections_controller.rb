class ConnectionsController < ApplicationController
	 before_action :authenticate_user!
	 def index
	 	 @connections = current_user.reverse_connections
	 end
	def create 
		 @connection = current_user.connections.build(connected_user_id: params[:connected_user_id])
		  @connection.status= "pending"
	    if @connection.save
           flash[:notice] = 'Connection request sent!'
       end
		 redirect_back fallback_location: root_path
	end
	 def destroy
	    @connection = Connection.find_by(user_id: current_user.id, connected_user_id: params[:id])||
	    @connection = Connection.find_by( connected_user_id: current_user.id)

	    if @connection
	      @connection.destroy
	      flash[:notice] = 'Connection removed!'
	    else
	      flash[:alert] = 'Connection not found!'
	    end
	    redirect_back fallback_location: root_path
  end
  def update
  
  	@connection = Connection.find_by(id: params[:id])
  	@connection.status="accepted"
  	byebug
  	@connection.save
  	redirect_back fallback_location: root_path
  end
end
