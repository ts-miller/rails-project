class CreatorsController < ApplicationController

    def new
        @creator = Creator.new
    end

    def create
        params[:creator][:email].downcase
        if !User.find_by(email: params[:creator][:email])
            @creator = Creator.new(creator_params)
            if @creator.save
                set_session(@creator)
                redirect_to creator_path(@creator)
            else
                render 'new'
            end
        else
            render 'new'
        end
    end

    def show
        @creator = Creator.find_by_id(params[:id])
    end

    def edit
        @creator = Creator.find_by_id(params[:id])
    end

    def update
        params[:creator][:email].downcase
        if !User.find_by(email: params[:creator][:email])
            @creator = Creator.find_by_id(params[:id])
            if @creator.update(creator_params)
                redirect_to creator_path(@creator)
            end
        end
        render 'edit'
    end

    def destroy
        @creator = Creator.find_by_id(params[:id])
        reset_session
        @creator.destroy
        redirect_to '/'
    end

    private

    def creator_params
        params.require(:creator).permit(:email, :name, :about, :password, :password_confirmation)
    end
end
