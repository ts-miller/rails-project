class PledgesController < ApplicationController

    def new
        redirect_if_not_logged_in
        if current_user.class != Creator
            @pledge = Pledge.find_or_initialize_by(
                user_id: current_user.id, 
                creator_id: params[:creator_id],
            )
            @tier = Tier.find_by(creator_id: params[:creator_id], amount: params[:amount].to_i)
        else
            # Creators can't support Creators at this time. Create a User account to support a creator.
            redirect_to creator_path(params[:creator_id])
        end
    end

    def create
        redirect_if_not_logged_in
        @pledge = Pledge.new(pledge_params)
        if @pledge.save
            redirect_to creator_path(@pledge.creator)
        else
            render 'new'
        end
    end

    def edit
        
    end

    def update
        @pledge = Pledge.find_by(id: params[:id])

        if @pledge.update(pledge_params)
            redirect_to creator_path(@pledge.creator)
        else
            render 'new'
        end
    end

    private

    def pledge_params
        params.require(:pledge).permit(:user_id, :creator_id, :amount)
    end
end
