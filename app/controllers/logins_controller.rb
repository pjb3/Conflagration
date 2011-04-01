class LoginsController < ApplicationController
  def create
    session[:user] = params[:user]
    redirect_to "/rubynation"
  end
end