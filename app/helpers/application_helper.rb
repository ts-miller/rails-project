module ApplicationHelper
    
    def logged_in?
        if !session[:user_id].blank?
            true
        else
            false
        end
    end
    
    def current_user
        if logged_in?
            User.find_by_id(session[:user_id])
        else
            nil
        end
    end
end
