class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
   @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email])
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

end
