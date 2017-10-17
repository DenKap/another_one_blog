class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy

  def create
    if params[:category_id].present?
      parent = Category.find(params[:category_id])
    else
      parent = Post.find(params[:post_id])
    end
    @comment = parent.comments.new(comment_params)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to parent, notice: 'Your comment has been added successfully'
        else
          redirect_to parent, alert: 'Please try again'
        end
      end

      format.js do
        @comment.save
        render :save
      end
    end
  end

  # def destroy
  #   parent = params[:post_id] || params[:category_id]
  #   @comment = parent.comments.find(params[:id])
  #   if @comment.created_at < 1.hour.ago
  #     redirect_to root_path, alert: "You can't destroy comment, 1 hour passed"
  #   else
  #     @comment.destroy
  #   end
  # end

  private

  def comment_params
    params.require(:comment).permit(:content, :author)
  end
end
