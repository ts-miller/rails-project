class CallbacksController < ApplicationController

    def google
        @user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id
        set_session(@user)
        redirect_to user_path(@user)
    end
end