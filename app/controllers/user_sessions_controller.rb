class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    @user = login(params[:name], params[:password])
    if @user.blank?
      flash.now[:alert] = 'Login failed'
      return render :new
    end

    redirect_back_or_to :users, notice: 'Login successful'
  end

  def destroy
    logout
    redirect_to :users, notice: 'Logged out!'
  end
end
