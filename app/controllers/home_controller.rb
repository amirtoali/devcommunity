class HomeController < ApplicationController
	def index
		@q = User.ransack(params[:q])
		@users = @q.result
	end
	def js
		render layout: false
	end
	def js2
		render layout: false
	end
end
