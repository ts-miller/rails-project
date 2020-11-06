class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to root_path, notice: "Already logged in."
        end
    end

    def create
        @user = Creator.find_by(email: params[:email])
        binding.pry
        @user ||= User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            set_session(@user)
            binding.pry
            #@user.class == User ? redirect_to user_path(@user) : redirect_to creator_path(@user)            
        else
            render 'sessions/new'
        end    
    end

    def destroy
        reset_session
        redirect_to root_path
    end
end