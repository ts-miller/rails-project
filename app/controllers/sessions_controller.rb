class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to root_path, notice: "Already logged in."
        end
    end

    def create
        @user = User.find_by(email: params[:email])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end    
    end

    def delete
        reset_session
        redirect_to root_path
    end
end