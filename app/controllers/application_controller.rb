class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_settings

  private

  def set_settings
    @settings = Setting.first
  end
end
