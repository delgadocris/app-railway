class StaticsController < ApplicationController
  def contact
  end

  def our
    # Pass instance variables from controller to view @var
    @message = "Hello from my controller"
    @users = ['Snow', 'Jean', 'Chris']
  end

  def other
  end
end
