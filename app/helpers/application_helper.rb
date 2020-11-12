module ApplicationHelper
    
    def correct_user_path(user)
        if user.class == User
            user_pledges_path(user)
        elsif user.class == Creator
            creator_path(user)
        else
            root_path
        end
    end

    def display_errors(msg)
        "#{msg[0].to_s.capitalize}: #{msg[1][0]}"
    end
end
