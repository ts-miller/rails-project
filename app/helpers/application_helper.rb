module ApplicationHelper
    
    def correct_user_path(user)
        if user.class == User
            user_path(user)
        elsif user.class == Creator
            creator_path(user)
        else
            root_path
        end
    end
end
