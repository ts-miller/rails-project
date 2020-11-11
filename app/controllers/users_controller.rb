class UsersController < ApplicationController
    before_action :clean_params, only: [:create, :update]


    def show
        @user = User.find_by_id(params[:id])
        redirect_if_not_owner(@user)
    end

    def new
        if logged_in?
            redirect_to root_path
        end
        @user = User.new
    end

    def create
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
        redirect_if_not_owner(@user)
    end

    def update
        if !Creator.find_by(email: params[:user][:email])
            @user = User.find_by_id(params[:id])
            if @user.update(user_params)
                redirect_to user_path(@user)
            end
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find_by_id(params[:id])
        redirect_if_not_owner(@user)
        reset_session
        @user.pledges.destroy_all
        @user.destroy
        redirect_to '/'
    end

    private

    def user_params

        params.require(:user).permit(:email, :name, :privacy, :password, :password_confirmation)
    end

    def clean_params
        params[:user][:name].titleize
        params[:user][:email].downcase
    end
end
