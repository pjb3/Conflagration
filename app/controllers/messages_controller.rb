class MessagesController < ApplicationController

  before_filter :login_required

  def index
    @messages = Message.all
    respond_to do |format|
      format.html
      format.js { render :json => @messages.map{|m| { :user => m.user, :room => m.room, :body => m.body }} }
    end
  end

  def create
    Message.create!(
      :room => params[:room],
      :user => current_user,
      :body => params[:message])
    respond_to do |format|
      format.html { redirect_to "/#{params[:room]}" }
      format.js { head :ok} 
    end
  end

  private
  def login_required
    redirect_to root_path unless current_user
  end
end