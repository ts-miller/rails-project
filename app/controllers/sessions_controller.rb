class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to root_path, notice: "Already logged in."
        end
    end

    def create
        @user = Creator.find_by(email: params[:email])
        @user ||= User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            set_session(@user)
            redirect_to_show_page(@user)            
        else
            render 'sessions/new'
        end    
    end

    def destroy
        reset_session
        redirect_to root_path
    end

    private

    def redirect_to_show_page(user)
        if user.class == User
            redirect_to user_path(user)
        else
            redirect_to creator_path(@user)
        end
    end
end