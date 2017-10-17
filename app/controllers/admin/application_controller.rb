class Admin::ApplicationController < ApplicationController
  layout 'admin'

  before_action :check_authorization

  private

  def check_authorization
    if session[:admin] != 'true'
      redirect_to root_path, alert: 'Page not found'
    end
  end
end
