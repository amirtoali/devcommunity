class ConnectionsController < ApplicationController
	def create 
		 @connection = current_user.connections.build(conteced_user_id: params[:connected_user_id])
		  @connection.status= "pending"
	    if @connection.save
           flash[:notice] = 'Connection request sent!'
       end
		byebug
	end
end
