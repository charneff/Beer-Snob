class SessionsController < ApplicationController
  def welcome
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
