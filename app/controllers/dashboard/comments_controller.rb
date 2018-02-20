module Dashboard
  class CommentController < TaskController 
  	before_action :set_task, only: [:create, :destroy]

  	def create
  	  # some code to be implemented
  	end

  	def destroy
  	  # some code to be implemented
  	end

  	private
  	 def comment_params
  	 	params.require(:comment).permit(:body)
  	 end
  end
end