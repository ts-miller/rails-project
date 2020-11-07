class PledgesController < ApplicationController

    def new
        redirect_if_not_logged_in
        @pledge = Pledge.find_or_initialize_by(
            user_id: current_user.id, 
            creator_id: params[:creator_id],
            # amount: params[:amount].to_i
        )
        # if @pledge.amount.blank?
        #     @pledge.amount = params[:amount].to_d
        # end
        @tier = Tier.find_by(creator_id: params[:creator_id], amount: params[:amount].to_i)
    end

    def create
        binding.pry
        redirect_if_not_logged_in
        @pledge = Pledge.new(pledge_params)
        if @pledge.save
            redirect_to creator_path(@pledge.creator)
        else
            render 'new'
        end
    end

    def edit
        binding.pry
    end

    def update
        binding.pry
    end

    private

    def pledge_params
        params.require(:pledge).permit(:user_id, :creator_id, :amount)
    end
end
