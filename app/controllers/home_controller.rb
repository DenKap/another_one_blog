class HomeController < ApplicationController
  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 10)
  end

  def login
  end

  def create_session
    if params[:email].downcase == @settings.email.downcase && Digest::MD5.hexdigest(params[:password]) == @settings.password
      session[:admin] = 'true'
      redirect_to admin_root_path
    else
      redirect_to login_path, alert: 'Sorry, try again please'
    end
  end

  def logout
    session[:admin] = nil
    redirect_to root_path
  end
end
