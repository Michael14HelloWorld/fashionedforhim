class ApplicationController < ActionController::Base
  before_filter :authenticate_admin!, except: [:index, :show]
  private
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def change
      create_table :users do |t|
      # Authlogic::ActsAsAuthentic::Email
      t.string    :email

      # Authlogic::ActsAsAuthentic::Password
      t.string    :crypted_password
      t.string    :password_salt

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string    :persistence_token

      # Authlogic::ActsAsAuthentic::SingleAccessToken
      t.string    :single_access_token

      # Authlogic::ActsAsAuthentic::PerishableToken
      t.string    :perishable_token

      # Authlogic::Session::MagicColumns
      t.integer   :login_count, default: 0, null: false
      t.integer   :failed_login_count, default: 0, null: false
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      # Authlogic::Session::MagicStates
      t.boolean   :active, default: false
      t.boolean   :approved, default: false
      t.boolean   :confirmed, default: false

      t.timestamps
    end
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
