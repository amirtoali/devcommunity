class MemberController < ApplicationController
	def show
		@member = User.find(params[:id])
	end
	def edit_description
		@member = User.find(params[:id])
		byebug
	end
def update_descriptions
	byebug
  @member = User.find(params[:id])
  
  if @member.update(about: params[:user][:about])
    render turbo_stream: turbo_stream.replace(
      "member-description",
      partial: "member/member_description",
      locals: { user: @member }
    )
  else
    render turbo_stream: turbo_stream.replace(
      "member-description-form",
      partial: "member/edit_description_form",
      locals: { user: @member }
    )
  end
end


end
