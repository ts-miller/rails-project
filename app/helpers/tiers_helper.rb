module TiersHelper

    # def pledge_below_tier?(user, tier)
    #     pledge = Pledge.find_by(user_id: user.id, creator_id: @creator.id)
    #     tier.amount <= pledge.amount
    # end

    def tier_button(tier)
        if !logged_in?
            link_to "Join", '/login', class: "button"
        elsif current_user.class == Creator
            if @creator == current_user
                link_to("Edit Tier", edit_creator_tier_path(tier.creator, tier), class: "button") +
                link_to("Delete Tier", tier_path(tier), data: { :confirm => 'Are you sure?' }, method: :delete, class: "button field-space")
            end
        elsif current_user.creators.include?(tier.creator)
            if current_user.pledge_amount(tier.creator) < tier.amount
                link_to "Join", new_creator_pledge_path(tier.creator, amount: tier.amount), class: "button"
            else
                content_tag :div, "Subscribed", class: "non-button"
            end
        else
            link_to "Join", new_creator_pledge_path(tier.creator, amount: tier.amount), class: "button"
        end
    end

end
