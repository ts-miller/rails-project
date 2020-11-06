class ApplicationController < ActionController::Base
    include ApplicationHelper
    helper_method :logged_in?, :current_user, :set_session


    def logged_in?
        if !session[:user_id].blank?
            true
        else
            false
        end
    end
    
    def current_user
        if logged_in? && (session[:creator] == false)
            User.find_by_id(session[:user_id])
        elsif logged_in? && (session[:creator] == true)
            Creator.find_by_id(session[:user_id])
        else
            nil
        end
    end

    def set_session(user)
        if user.class == User
            session[:creator] = false
            session[:user_id] = user.id
        else
            session[:creator] = true
            session[:user_id] = user.id
        end
    end
end
