class CreatorsController < ApplicationController
    before_action :clean_params, only: [:create, :update]
    
    def index
        if params[:search].blank?
            @creators = Creator.all
        else
            @creators = Creator.state(params[:search])
        end
    end

    def new
        @creator = Creator.new
    end

    def create
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
        redirect_if_not_owner(@creator)
    end

    def update
        if !User.find_by(email: params[:creator][:email])
            @creator = Creator.find_by_id(params[:id])
            if @creator.update(creator_params)
                redirect_to creator_path(@creator)
            end
        else
            render 'edit'
        end
    end

    def destroy
        @creator = Creator.find_by_id(params[:id])
        redirect_if_not_owner(@creator)
        reset_session
        @creator.destroy
        redirect_to '/'
    end

    private

    def creator_params
        params.require(:creator).permit(:email, :name, :about, :password, :password_confirmation)
    end

    def clean_params
        params[:creator][:name].titleize
        params[:creator][:email].downcase
    end
end
