class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id]) rescue nil
    if @category.blank?
      redirect_to root_path, alert: 'Category not found'
    else
      @posts = @category.posts.paginate(page: params[:page], per_page: 10).includes(:comments).order('posts.created_at DESC')
      @comment = @category.comments.new
      @comments = @category.comments
    end
  end
end
