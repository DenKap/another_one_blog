class PostsController < ApplicationController
  before_action :set_category
  before_action :set_post, only: %i[edit update destroy show]
  before_action :check_access, only: :destroy

  def show
    @comment = @post.comments.new
    @comments = @post.comments
  end

  def new
    @post = @category.posts.new
  end

  def create
    @post = @category.posts.new(post_params)
    if @post.save
      # if params[:post_files].present?
      #   params[:post_files].each do |file|
      #     PostFile.create(file: file, post_id: @post.id)
      #   end
      # end
      redirect_to category_path(@category), notice: "#{@post.name} has been added"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to category_path(@category), notice: "#{@post.name} has been updated successfully"
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to category_path(@category), notice: "#{@post.name} has been removed"
    else
      redirect_to category_path(@category), alert: "Couldn't remove #{@post.name}"
    end
  end

  private

  def set_post
    @post = @category.posts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to category_path(@category), alert: "Couldn't find this post"
  end

  def set_category
    @category = Category.find(params[:category_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Category not found'
  end

  def check_access
    redirect_to root_path unless session[:admin] == 'true'
  end

  def post_params
    params.require(:post).permit(:name, :content, :category_id, :file)
  end
end
