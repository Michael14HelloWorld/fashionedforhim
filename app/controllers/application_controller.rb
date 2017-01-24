class ApplicationController < ActionController::Base
  before_filter :authenticate_admin!, except: [:index, :show]
  private
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
  protect_from_forgery with: :exception
  
  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.new(admin_session_params)
    if @admin_session.save
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def destroy
    current_admin_session.destroy
    redirect_to new_admin_session_url
  end

  private

  def admin_session_params
    params.require(:admin_session).permit(:email, :password)
  end
  
end
