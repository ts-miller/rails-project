class TiersController < ApplicationController
    before_action :clean_params, only: [:create, :update]

    def show
        @tiers = Tier.most_expensive_9
    end
    
    def new
        @creator = Creator.find_by_id(params[:creator_id])
        redirect_if_not_owner(@creator)
        @tier = Tier.new
    end

    def create
        @tier = Tier.new(tier_params)
        if @tier.save
            redirect_to creator_path(@tier.creator)
        else
            render 'new'
        end
    end

    def edit
        @creator = Creator.find_by(id: params[:creator_id])
        @tier = Tier.find_by(id: params[:id])
        redirect_if_not_owner(@creator)
    end

    def update
        @tier = Tier.find_by(id: params[:id])
        if @tier.update(tier_params)
            redirect_to creator_path(@tier.creator)
        else
            render 'edit'
        end
    end

    def destroy
        @tier = Tier.find_by_id(params[:id])
        redirect_if_not_owner(@tier.creator)
        @tier.destroy
        redirect_to creator_path(@tier.creator)
    end

    private

    def tier_params
        params.require(:tier).permit(:title, :amount, :description, :creator_id)
    end

    def clean_params
        params[:tier][:title] = params[:tier][:title].titleize
    end
end
