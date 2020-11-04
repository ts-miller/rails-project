class CallbacksController < ApplicationController

    def google
        @user = User.from_omniauth(request.env["omniauth.auth"])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end
end