class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    votes = Vote.where(voter_id: current_user)
    @saved_jobs = []
    votes.each do |vote|
      @saved_jobs << Job.find(vote.votable_id)
    end
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the JobScraper! Account successfully created."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end

end
