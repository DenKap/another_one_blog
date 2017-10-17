class Admin::SettingsController < Admin::ApplicationController
  def index
  end

  def update
    if @settings.update(settings_params)
      redirect_to admin_settings_path, notice: 'Settings have been updated successfully'
    else
      render :index
    end
  end

  private

  def settings_params
    params.require(:setting).permit(:info, :contact_email, :email, :new_password)
  end
end
