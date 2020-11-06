class UsersController < ApplicationController
    def show
        @user = User.find_by(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        params[:user][:email].downcase
        if !Creator.find_by(email: params[:user][:email]) 
            @user = User.new(user_params)
            if @user.save
                set_session(@user)
                redirect_to user_path(@user)
            else
                render 'new'
            end
        else
            render 'new'
        end
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def update
        params[:user][:email].downcase
        if !Creator.find_by(email: params[:user][:email])
            @user = User.find_by_id(params[:id])
            if @user.update(user_params)
                redirect_to user_path(@user)
            end
        end
        render 'edit'
    end

    def destroy
        @user = User.find_by_id(params[:id])
        reset_session
        @user.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
