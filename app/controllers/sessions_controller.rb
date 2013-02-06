class SessionsController < ApplicationController
# before_filter :already_signed_in, only: [:new, :create] # this could be uncommented to stop signed-in users signing in again

  def new
#      if signed_in?
#        redirect_to root_url, notice: "Already signed in."
#      end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'See ya!'
    redirect_to root_url
  end

#  private
#
#    def already_signed_in
#      if signed_in?
#       redirect_to root_url, notice: "Already signed in."
#      end
#    end
end
