class WorkExpriencesController < ApplicationController
	 before_action :authenticate_user!
	 before_action :set_work_exprience, only: %i[edit update destroy]
	 def new
	 	@work_exprience = current_user.work_expriences.new
	 end
	 def create
	 	@work_exprience = current_user.work_expriences.new(work_exprience_params)
	 	byebug
	 	if @work_exprience.save
	 		redirect_to root_path
	 	else
	 		render :new
	 	end
	 end
	 def edit 
	 end
	 def update
	 	if @work_exprience.update(work_exprience_params)
	      redirect_to root_path
	    end
	end
	def destroy
	  if @work_exprience.destroy
	  	 redirect_to root_path
	  end
	end

	 private
	 def set_work_exprience
	 	@work_exprience = WorkExprience.find(params[:id])
	 end

     def work_exprience_params
     	params.require(:work_exprience).permit(:company, :start_date, :end_date, :job_title, :employment_type, :location, :location_type, :currently_working_here, :description, :user_id)
     end

end
