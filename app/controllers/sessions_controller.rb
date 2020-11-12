class SessionsController < ApplicationController
    def new
        @user = User.new
        if logged_in?
            redirect_to root_path
        end
    end

    def create
        @user = Creator.find_by(email: params[:email])
        @user ||= User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            set_session(@user)
            redirect_to_show_page(@user)
        else
            flash.now[:notice] = "Wrong email or password. Try again."
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
            redirect_to user_pledges_path(user)
        else
            redirect_to creator_path(user)
        end
    end
end