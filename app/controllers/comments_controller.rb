class CommentsController < ApplicationController
    def create
        @location = Location.find(params[:location_id])
        @comment = @location.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
    end

    private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
