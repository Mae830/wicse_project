class CommentsController < ApplicationController
    def create
        @location = Location.find(params[:location_id])
        @comment = @location.comments.build(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to location_path(@location)
    end
    def destroy
      @comment = current_user.comments.find(params[:id])
      if @comment
        @location = @comment.location
        @comment.destroy
        redirect_to location_path(@location)
      else
        redirect_to root_path
      end
    end
    def edit
      @comment = current_user.comments.find(params[:id])
    end 
    private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
